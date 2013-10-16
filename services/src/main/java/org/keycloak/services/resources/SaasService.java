package org.keycloak.services.resources;

import org.jboss.resteasy.annotations.cache.NoCache;
import org.jboss.resteasy.logging.Logger;
import org.jboss.resteasy.spi.HttpRequest;
import org.jboss.resteasy.spi.HttpResponse;
import org.jboss.resteasy.spi.NotImplementedYetException;
import org.keycloak.models.*;
import org.keycloak.services.managers.AuthenticationManager;
import org.keycloak.services.managers.AuthenticationManager.AuthenticationStatus;
import org.keycloak.services.managers.RealmManager;
import org.keycloak.services.messages.Messages;
import org.keycloak.services.resources.admin.RealmsAdminResource;
import org.keycloak.services.resources.flows.Flows;

import javax.ws.rs.*;
import javax.ws.rs.container.ResourceContext;
import javax.ws.rs.core.*;

/**
 * @author <a href="mailto:bill@burkecentral.com">Bill Burke</a>
 * @version $Revision: 1 $
 */
@Path("/saas")
public class SaasService {
    protected static final Logger logger = Logger.getLogger(SaasService.class);
    public static final String REALM_CREATOR_ROLE = "realm-creator";
    public static final String SAAS_IDENTITY_COOKIE = "KEYCLOAK_SAAS_IDENTITY";

    @Context
    protected UriInfo uriInfo;

    @Context
    protected HttpRequest request;

    @Context
    protected HttpResponse response;

    @Context
    protected KeycloakSession session;

    @Context
    protected ResourceContext resourceContext;

    protected String adminPath = "/admin/index.html";
    protected AuthenticationManager authManager = new AuthenticationManager();

    public static class WhoAmI {
        protected String userId;
        protected String displayName;

        public WhoAmI() {
        }

        public WhoAmI(String userId, String displayName) {
            this.userId = userId;
            this.displayName = displayName;
        }

        public String getUserId() {
            return userId;
        }

        public void setUserId(String userId) {
            this.userId = userId;
        }

        public String getDisplayName() {
            return displayName;
        }

        public void setDisplayName(String displayName) {
            this.displayName = displayName;
        }
    }

    @Path("keepalive")
    @GET
    @NoCache
    public Response keepalive(final @Context HttpHeaders headers) {
        logger.debug("keepalive");
        RealmManager realmManager = new RealmManager(session);
        RealmModel realm = getAdminstrationRealm(realmManager);
        if (realm == null)
            throw new NotFoundException();
        UserModel user = authManager.authenticateSaasIdentityCookie(realm, uriInfo, headers);
        if (user == null) {
            return Response.status(401).build();
        }
        NewCookie refreshCookie = authManager.createSaasIdentityCookie(realm, user, uriInfo);
        return Response.noContent().cookie(refreshCookie).build();
    }

    @Path("whoami")
    @GET
    @Produces("application/json")
    @NoCache
    public Response whoAmI(final @Context HttpHeaders headers) {
        RealmManager realmManager = new RealmManager(session);
        RealmModel realm = getAdminstrationRealm(realmManager);
        if (realm == null)
            throw new NotFoundException();
        UserModel user = authManager.authenticateSaasIdentityCookie(realm, uriInfo, headers);
        if (user == null) {
            return Response.status(401).build();
        }
        // keycloak is bootstrapped with an admin user with no first/last name, so use login name as display name
        return Response.ok(new WhoAmI(user.getLoginName(), user.getLoginName())).build();
    }

    @Path("isLoggedIn.js")
    @GET
    @Produces("application/javascript")
    @NoCache
    public String isLoggedIn(final @Context HttpHeaders headers) {
        logger.debug("WHOAMI Javascript start.");
        RealmManager realmManager = new RealmManager(session);
        RealmModel realm = getAdminstrationRealm(realmManager);
        if (realm == null) {
            return "var keycloakCookieLoggedIn = false;";

        }
        UserModel user = authManager.authenticateSaasIdentityCookie(realm, uriInfo, headers);
        if (user == null) {
            return "var keycloakCookieLoggedIn = false;";
        }
        logger.debug("WHOAMI: " + user.getLoginName());
        return "var keycloakCookieLoggedIn = true;";
    }

    public static UriBuilder contextRoot(UriInfo uriInfo) {
        return UriBuilder.fromUri(uriInfo.getBaseUri()).replacePath("/auth-server");
    }

    public static UriBuilder saasCookiePath(UriInfo uriInfo) {
        return contextRoot(uriInfo).path("rest").path(SaasService.class);
    }

    @Path("admin/realms")
    public RealmsAdminResource getRealmsAdmin(@Context final HttpHeaders headers) {
        RealmManager realmManager = new RealmManager(session);
        RealmModel saasRealm = getAdminstrationRealm(realmManager);
        if (saasRealm == null)
            throw new NotFoundException();
        UserModel admin = authManager.authenticateSaasIdentity(saasRealm, uriInfo, headers);
        if (admin == null) {
            throw new NotAuthorizedException("Bearer");
        }
        ApplicationModel adminConsole = saasRealm.getApplicationNameMap().get(Constants.ADMIN_CONSOLE_APPLICATION);
        if (adminConsole == null) {
            throw new NotFoundException();
        }
        RoleModel adminRole = adminConsole.getRole(Constants.ADMIN_CONSOLE_ADMIN_ROLE);
        if (!adminConsole.hasRole(admin, adminRole)) {
            logger.warn("not a Realm admin");
            throw new NotAuthorizedException("Bearer");
        }
        RealmsAdminResource adminResource = new RealmsAdminResource(admin);
        resourceContext.initResource(adminResource);
        return adminResource;
    }

    @Path("login")
    @GET
    @NoCache
    public Response loginPage() {
        RealmManager realmManager = new RealmManager(session);
        RealmModel realm = getAdminstrationRealm(realmManager);
        authManager.expireSaasIdentityCookie(uriInfo);

        return Flows.forms(realm, request, uriInfo).forwardToLogin();
    }

    @Path("logout")
    @GET
    @NoCache
    public Response logout() {
        RealmManager realmManager = new RealmManager(session);
        RealmModel realm = getAdminstrationRealm(realmManager);
        authManager.expireSaasIdentityCookie(uriInfo);

        return Flows.forms(realm, request, uriInfo).forwardToLogin();
    }

    @Path("logout-cookie")
    @GET
    @NoCache
    public void logoutCookie() {
        logger.debug("*** logoutCookie");
        authManager.expireSaasIdentityCookie(uriInfo);
    }

    @Path("login")
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response processLogin(final MultivaluedMap<String, String> formData) {
        logger.info("processLogin start");
        RealmManager realmManager = new RealmManager(session);
        RealmModel realm = getAdminstrationRealm(realmManager);
        if (realm == null)
            throw new NotFoundException();

        if (!realm.isEnabled()) {
            throw new NotImplementedYetException();
        }
        String username = formData.getFirst("username");
        UserModel user = realm.getUser(username);

        AuthenticationStatus status = authManager.authenticateForm(realm, user, formData);

        switch (status) {
            case SUCCESS:
                NewCookie cookie = authManager.createSaasIdentityCookie(realm, user, uriInfo);
                return Response.status(302).cookie(cookie).location(contextRoot(uriInfo).path(adminPath).build()).build();
            case ACCOUNT_DISABLED:
                return Flows.forms(realm, request, uriInfo).setError(Messages.ACCOUNT_DISABLED).setFormData(formData)
                        .forwardToLogin();
            case ACTIONS_REQUIRED:
                return Flows.forms(realm, request, uriInfo).forwardToAction(user.getRequiredActions().iterator().next());
            default:
                return Flows.forms(realm, request, uriInfo).setError(Messages.INVALID_USER).setFormData(formData)
                        .forwardToLogin();
        }
    }

    protected RealmModel getAdminstrationRealm(RealmManager realmManager) {
        return realmManager.getKeycloakAdminstrationRealm();
    }
}
