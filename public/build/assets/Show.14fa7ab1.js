import{A as r}from"./AppLayout.0f21bcf8.js";import e from"./DeleteUserForm.f5ad9bbe.js";import{J as s}from"./SectionBorder.bc488d31.js";import m from"./LogoutOtherBrowserSessionsForm.fe407a47.js";import a from"./TwoFactorAuthenticationForm.eb230641.js";import i from"./UpdatePasswordForm.5cb6314b.js";import n from"./UpdateProfileInformationForm.b14a7297.js";import{n as p}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.8980123f.js";import"./app.8c123d0c.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.af9b0a02.js";import"./Modal.ad2d7f8e.js";import"./SectionTitle.c7331ac0.js";import"./DialogModal.5d29c1a3.js";import"./DangerButton.bc0a3d2c.js";import"./InputError.e00842e5.js";import"./SecondaryButton.c6e6eeac.js";import"./ActionMessage.8be8edc5.js";import"./Button.186b2831.js";import"./Label.cc2c2b6e.js";const c={props:["sessions"],components:{AppLayout:r,DeleteUserForm:e,JetSectionBorder:s,LogoutOtherBrowserSessionsForm:m,TwoFactorAuthenticationForm:a,UpdatePasswordForm:i,UpdateProfileInformationForm:n}};var l=function(){var o=this,t=o._self._c;return t("app-layout",{scopedSlots:o._u([{key:"header",fn:function(){return[t("h2",{staticClass:"font-semibold text-xl text-gray-800 leading-tight"},[o._v(" Profile ")])]},proxy:!0}])},[t("div",[t("div",{staticClass:"max-w-7xl mx-auto py-10 sm:px-6 lg:px-8"},[o.$page.jetstream.canUpdateProfileInformation?t("div",[t("update-profile-information-form",{attrs:{user:o.$page.user}}),t("jet-section-border")],1):o._e(),o.$page.jetstream.canUpdatePassword?t("div",[t("update-password-form",{staticClass:"mt-10 sm:mt-0"}),t("jet-section-border")],1):o._e(),o.$page.jetstream.canManageTwoFactorAuthentication?t("div",[t("two-factor-authentication-form",{staticClass:"mt-10 sm:mt-0"}),t("jet-section-border")],1):o._e(),t("logout-other-browser-sessions-form",{staticClass:"mt-10 sm:mt-0",attrs:{sessions:o.sessions}}),t("jet-section-border"),t("delete-user-form",{staticClass:"mt-10 sm:mt-0"})],1)])])},f=[],d=p(c,l,f,!1,null,null,null,null);const z=d.exports;export{z as default};
