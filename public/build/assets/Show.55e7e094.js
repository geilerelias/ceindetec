import{A as o}from"./AppLayout.7e6a42a7.js";import e from"./DeleteUserForm.083ac761.js";import{J as s}from"./SectionBorder.bc488d31.js";import a from"./LogoutOtherBrowserSessionsForm.c9e662f9.js";import m from"./TwoFactorAuthenticationForm.e538f6a3.js";import i from"./UpdatePasswordForm.9622345f.js";import p from"./UpdateProfileInformationForm.d5210e07.js";import{B as n}from"./BreadCrumbs.14245490.js";import{n as d}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.69c5493d.js";import"./app.77aa44cf.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.da80baee.js";import"./Modal.ad2d7f8e.js";import"./SectionTitle.c7331ac0.js";import"./DialogModal.5d29c1a3.js";import"./DangerButton.bc0a3d2c.js";import"./InputError.e00842e5.js";import"./SecondaryButton.c6e6eeac.js";import"./ActionMessage.8be8edc5.js";import"./Button.186b2831.js";import"./Label.cc2c2b6e.js";const f={props:["sessions"],components:{BreadCrumbs:n,AppLayout:o,DeleteUserForm:e,JetSectionBorder:s,LogoutOtherBrowserSessionsForm:a,TwoFactorAuthenticationForm:m,UpdatePasswordForm:i,UpdateProfileInformationForm:p},data(){return{items:[{text:"Dashboard",disabled:!1,href:"dashboard"},{text:"Profile",disabled:!0,href:"areas.user.profile"}]}}};var l=function(){var r=this,t=r._self._c;return t("app-layout",[t("bread-crumbs",{attrs:{name:"Profile",items:r.items}}),t("div",[t("div",{staticClass:"max-w-7xl mx-auto py-10 sm:px-6 lg:px-8"},[r.$page.props.jetstream.canUpdateProfileInformation?t("div",[t("update-profile-information-form",{attrs:{user:r.$page.props.user}}),t("jet-section-border")],1):r._e(),r.$page.props.jetstream.canUpdatePassword?t("div",[t("update-password-form",{staticClass:"mt-10 sm:mt-0"}),t("jet-section-border")],1):r._e(),r.$page.props.jetstream.canManageTwoFactorAuthentication?t("div",[t("two-factor-authentication-form",{staticClass:"mt-10 sm:mt-0"}),t("jet-section-border")],1):r._e(),t("logout-other-browser-sessions-form",{staticClass:"mt-10 sm:mt-0",attrs:{sessions:r.sessions}}),t("jet-section-border"),t("delete-user-form",{staticClass:"mt-10 sm:mt-0"})],1)])],1)},c=[],u=d(f,l,c,!1,null,null,null,null);const O=u.exports;export{O as default};