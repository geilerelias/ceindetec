import{A as e}from"./AppLayout.d8256fea.js";import{B as i}from"./BreadCrumbs.14245490.js";import{n as r}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.b2b49248.js";import"./app.7acbb6e1.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.da80baee.js";const l={name:"Show",components:{AppLayout:e,BreadCrumbs:i},props:["data","errors"],data:()=>({search:"",items:[{text:"Dashboard",disabled:!1,href:"/dashboard"},{text:"Establecimientos",disabled:!1,href:"/dashboard/establishment"},{text:"Visualizar",disabled:!0,href:"#"}]})};var d=function(){var a=this,t=a._self._c;return t("app-layout",[t("bread-crumbs",{attrs:{name:"Visualizaci\xF3n de establecimiento",items:a.items}}),t("v-container",[t("v-card",{staticClass:"px-6 py-4"},[t("v-container",{staticClass:"container"},[t("div",{staticClass:"d-flex flex-wrap justify-space-between"},[t("div",{staticClass:"flex-1"},[t("div",{staticClass:"d-flex align-start justify-space-between"},[t("div",{staticClass:"mb-3"},[t("h5",{staticClass:"mr-2 mb-0 text-h6 text-uppercase"},[a._v(" "+a._s(a.data.name)+" ")]),t("p",{staticClass:"text--disabled mb-0"},[a._v(" Numero NIT: "+a._s(a.data.nit)+" ")]),t("div",{staticClass:"d-flex"},[t("div",{staticClass:"text--disabled mb-0"},[a._v(" Municipio de "+a._s(a.data.municipality)+" \xA0 ")]),t("div",{staticClass:"text--disabled mb-0"},[a._v(" Departamento de "+a._s(a.data.department)+" ")])])])])]),t("div",{staticClass:"flex-1 text-right"},[t("v-btn",{staticClass:"mr-2",attrs:{fab:"","x-small":""}},[t("v-icon",[a._v(" mdi-email-outline ")])],1),t("v-btn",{attrs:{fab:"","x-small":""}},[t("v-icon",[a._v(" mdi-dots-horizontal ")])],1)],1)])])],1)],1),t("v-container",[t("v-row",[t("v-col",{attrs:{cols:"12",sm:"4"}},[t("v-card",{staticClass:"mx-auto",attrs:{"max-width":"344"}},[t("v-card-text",[t("div",[a._v("Establecimiento")]),t("p",{staticClass:"text-h5 text--primary"},[a._v(" "+a._s(a.data.name)+" ")]),t("p",[a._v("Localizaci\xF3n")]),t("div",{staticClass:"text--primary"},[a._v(" Municipio de "+a._s(a.data.municipality)),t("br"),a._v(" Departamento de "+a._s(a.data.department)+" ")])])],1)],1),t("v-col",{attrs:{cols:"12",sm:"8"}},[t("v-sheet",{attrs:{"min-height":"70vh",rounded:"lg"}},[t("v-row",{staticClass:"ma-0"},[t("v-col",[t("v-row",{staticClass:"no-gutters"},[t("div",{staticClass:"d-flex justify-space-between justify-md-start col-md-6 col-12"},[t("inertia-link",{attrs:{href:a.route("establishment.create")}},[t("v-btn",{staticClass:"mr-3 success"},[t("v-icon",{staticClass:"notranslate mr-2"},[a._v(" mdi-plus ")]),a._v(" Add ")],1)],1),t("v-btn",{staticClass:"button-shadow primary--text",attrs:{outlined:""}},[t("v-icon",{staticClass:"notranslate mr-2",attrs:{"aria-hidden":"true"}},[a._v(" mdi-filter-variant ")]),a._v(" Filters ")],1)],1),t("v-spacer"),t("div",{staticClass:"mx-auto mt-4 mt-md-0",staticStyle:{"max-width":"250px"}},[t("v-text-field",{attrs:{"hide-details":"",dense:"",enclosed:"",outlined:"","append-icon":"mdi-magnify",placeholder:"search"},model:{value:a.search,callback:function(s){a.search=s},expression:"search"}})],1)],1)],1)],1)],1)],1)],1)],1)],1)},n=[],c=r(l,d,n,!1,null,"95d01f47",null,null);const h=c.exports;export{h as default};
