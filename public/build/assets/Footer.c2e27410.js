import{m as a}from"./app.8bbe0a1c.js";import{l as o}from"./logo-ceindetec.0997e866.js";import{n as s}from"./_plugin-vue2_normalizer.358ffe07.js";const n="/build/assets/ninos-wayuu.732823d3.jpg",l="/build/assets/ninos-wayuu-lazy.070b1564.jpg";const c={data(){return{bg:n,logo:o,lazy:l,dialogPrivacyPolicies:!1,dialogTermCondition:!1,socialMedia:[{icon:"mdi-facebook",link:""},{icon:" mdi-twitter",link:""},{icon:"mdi-linkedin",link:""},{icon:"mdi-google-plus",link:""},{icon:"mdi-whatsapp",link:""}]}},computed:{...a(["drawer","links"])}};var r=function(){var i=this,t=i._self._c;return t("div",[t("v-img",{staticClass:"my-0 py-0",attrs:{src:i.bg,"lazy-src":i.lazy}},[t("v-footer",{staticClass:"px-0 my-0 py-0 fill-height",staticStyle:{"background-color":"rgba(8, 0, 56, 0.77)"}},[t("v-container",{staticClass:"py-5"},[t("v-row",{staticClass:"py-4 d-flex justify-between",style:`height:${i.$vuetify.breakpoint.mdAndUp?"230px":"auto"}`},[t("v-col",[t("div",[t("inertia-link",{staticClass:"mr-2",attrs:{href:"/"}},[t("v-img",{staticStyle:{width:"150px !important"},attrs:{src:i.logo,cover:"",alt:""}})],1)],1),t("div",{staticClass:"text-body-1 secondary--text text--lighten-2"},[t("div",[i._v("Centro de Desarrollo Tecnol\xF3gico")]),t("div",{staticClass:"mt-2"},i._l(i.socialMedia,function(e){return t("v-btn",{key:e.id,staticClass:"mr-1 secondary--text text--lighten-2",attrs:{icon:"",rounded:"",light:""}},[t("v-icon",{attrs:{light:""}},[i._v(i._s(e.icon))])],1)}),1)])]),t("v-col",{staticClass:"col-md-3 col-12"},[t("div",{staticClass:"secondary--text font-weight-bold text-uppercase"},[i._v(" enlaces \xFAtiles ")]),t("div",{staticClass:"mb-4 mt-1 white rounded-lg",staticStyle:{width:"80px",height:"3px"}}),t("div",{staticClass:"d-flex flex-wrap"},i._l(i.links,function(e){return t("div",{key:e.id,staticClass:"w-half mb-1"},[t("a",{staticClass:"text-decoration-none white--text",attrs:{href:i.route(e.route)}},[i._v(" "+i._s(e.title)+" ")])])}),0)]),t("v-col",{staticClass:"col-md-3 col-12 justify-text"},[t("div",{staticClass:"secondary--text font-weight-bold text-uppercase"},[i._v(" Informaci\xF3n de contacto ")]),t("div",{staticClass:"mb-4 mt-1 white rounded-lg",staticStyle:{width:"80px",height:"3px"}}),t("div",{staticClass:"d-flex mb-2"},[t("v-icon",{staticClass:"mr-2 mdi secondary--text text--lighten-1"},[i._v(" mdi-phone-outline ")]),t("a",{staticClass:"text-decoration-none white--text text--lighten-2",attrs:{href:"tel:3504944938"}},[i._v(" 3504944938 ")]),t("span",{staticClass:"mx-1 white--text"},[i._v("-")]),t("a",{staticClass:"text-decoration-none white--text text--lighten-2",attrs:{href:"tel:3138161129"}},[i._v(" 3138161129 ")])],1),t("div",{staticClass:"d-flex mb-2"},[t("v-icon",{staticClass:"mr-2 mdi secondary--text text--lighten-1"},[i._v(" mdi-email-outline ")]),t("a",{staticClass:"text-decoration-none white--text text--lighten-2",attrs:{href:"mailto:informacion@ceindetec.org.co"}},[i._v(" informacion@ceindetec.org.co ")])],1),t("div",{staticClass:"d-flex mb-2 white--text"},[t("v-icon",{staticClass:"mr-2 mdi secondary--text text--lighten-1"},[i._v(" mdi-map-marker-outline ")]),i._v(" Calle 10 39-30, Esperanza 3ra etapa ")],1)]),t("v-col",{staticClass:"col-auto col-sm-1 d-flex align-items-center"},[t("div",{staticClass:"d-flex flex-column flex-wrap mr-3",staticStyle:{height:"100px"}})])],1)],1),t("section",{staticClass:"pt-2 mx-0 mb-0",staticStyle:{"background-color":"rgba(0, 0, 0, 0.3)",width:"100%"}},[t("v-container",[t("p",{staticClass:"text-white float-right d-sm-inline white--text"},[t("a",{staticClass:"base-body text-body-1 mx-auto grey--text text--darken-1 text-left mb-0",on:{click:function(e){i.dialogTermCondition=!i.dialogTermCondition}}},[i._v(" T\xE9rminos y Condiciones ")]),t("span",[i._v("|")]),t("a",{staticClass:"base-body text-body-1 mx-auto grey--text text--darken-1 text-left mb-0",on:{click:function(e){i.dialogPrivacyPolicies=!i.dialogPrivacyPolicies}}},[i._v(" Pol\xEDticas de Privacidad ")]),i.$vuetify.breakpoint.smAndUp?t("span",[i._v(" | \xA0 ")]):t("br"),i._v(" Dise\xF1ado por "),t("span",{staticClass:"secondary--text"},[i._v(" Luisa Mar\xEDa Alzate ")]),i._v(" \xA9 2022 ")])])],1),t("div",{staticClass:"text-center"},[t("v-dialog",{attrs:{width:"500"},model:{value:i.dialogTermCondition,callback:function(e){i.dialogTermCondition=e},expression:"dialogTermCondition"}},[t("v-card",[t("v-card-title",{staticClass:"text-h5 grey lighten-2"},[i._v(" T\xE9rminos y Condiciones ")]),t("v-card-text",[i._v(" Agregar t\xE9rminos y condiciones Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ")]),t("v-divider"),t("v-card-actions",[t("v-spacer"),t("v-btn",{attrs:{color:"primary",text:""},on:{click:function(e){i.dialogTermCondition=!1}}},[i._v(" I accept ")])],1)],1)],1)],1),t("div",{staticClass:"text-center"},[t("v-dialog",{attrs:{width:"500"},model:{value:i.dialogPrivacyPolicies,callback:function(e){i.dialogPrivacyPolicies=e},expression:"dialogPrivacyPolicies"}},[t("v-card",[t("v-card-title",{staticClass:"text-h5 grey lighten-2"},[i._v(" Privacy Policy ")]),t("v-card-text",[i._v(" Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ")]),t("v-divider"),t("v-card-actions",[t("v-spacer"),t("v-btn",{attrs:{color:"primary",text:""},on:{click:function(e){i.dialogPrivacyPolicies=!1}}},[i._v(" I accept ")])],1)],1)],1)],1)],1)],1)],1)},d=[],m=s(c,r,d,!1,null,null,null,null);const g=m.exports;export{g as F};
