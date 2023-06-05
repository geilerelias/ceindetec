import{P as i}from"./PageLayout.b1f59981.js";import{B as l}from"./BreadCrumbs.14245490.js";import{b as r}from"./computer3.c302f3b5.js";import{S as o}from"./SpinnerComponent.6d0b39d4.js";import{n}from"./_plugin-vue2_normalizer.358ffe07.js";import"./PageLayout.vue_vue_type_style_index_0_scoped_c322193c_lang.c1e332eb.js";import"./app.1e841923.js";import"./logo-ceindetec.0997e866.js";import"./SettingsDropdown.da80baee.js";import"./Footer.e9279ddd.js";const c={components:{SpinnerComponent:o,PageLayout:i,BreadCrumbs:l},name:"ContactUs",data:()=>({bg:r,items:[{text:"Inicio",disabled:!1,href:"/"},{text:"Contacto",disabled:!0,href:"/contact-us"}],valid:!1,mail:{name:"",email:"",subject:"",content:""},overlay:!1}),methods:{validate(){if(!this.$refs.form.validate())return;this.overlay=!0;const s=this.mail;this.overlay=!0,axios.post("/send-mail",s).then(e=>{this.overlay=!1,this.$swal("Mensaje enviado!","Mensaje enviado correctamente \u{1F600}","success"),this.reset()}).catch(e=>{this.$swal("Error en el env\xEDo","ha ocurrido un error en el env\xEDo del mensaje \u{1F625}","error"),this.overlay=!1}).finally(()=>{this.overlay=!1}),console.log(this.mail)},reset(){this.$refs.form.reset()},resetValidation(){this.$refs.form.resetValidation()}}};var d=function(){var e=this,t=e._self._c;return t("page-layout",[t("section",[t("v-row",{staticClass:"no-gutters"},[t("v-col",{staticClass:"col col-12"},[t("section",[t("v-img",{staticStyle:{height:"250px","max-width":"100%"},attrs:{cover:"",color:"#45516b",gradient:"to top, rgba(5, 11, 31, 0.8), rgba(5, 11, 31, 0.8)",src:e.bg,"max-width":"100%"}},[t("v-row",{staticClass:"ma-0 fill-height text-center d-flex align-center justify-center"},[t("v-col",{staticClass:"col-12"},[t("h1",{staticClass:"text-h3 font-weight-500 mb-2 white--text animate__animated animate__zoomIn"},[e._v(" Contacto")]),t("v-responsive",{staticClass:"secondary mx-auto mb-6 base-divider--dense",staticStyle:{"max-width":"28px"},attrs:{dense:""}},[t("div",{staticClass:"v-responsive__content"},[t("v-divider")],1)]),t("v-breadcrumbs",{staticClass:"secondary--text justify-center pa-0 theme--dark",attrs:{items:e.items,divider:"/"},scopedSlots:e._u([{key:"item",fn:function({item:a}){return[t("v-breadcrumbs-item",{attrs:{href:a.href,disabled:a.disabled}},[t("span",{class:a.disabled?"white--text":"secondary--text"},[e._v(e._s(a.text.toUpperCase()))])])]}}])})],1)],1)],1)],1)])],1)],1),t("v-sheet",{staticClass:"rounded-0",staticStyle:{padding:"56px 0px"},attrs:{light:""}},[t("v-container",{staticClass:"container"},[t("v-row",{staticClass:"justify-space-between"},[t("v-col",{staticClass:"col-md-5 col-12"},[t("div",[t("v-container",{staticClass:"container pa-0",attrs:{pace:"6"}},[t("v-row",{staticClass:"no-gutters justify-start"},[t("v-col",{staticClass:"col-12"},[t("h3",{staticClass:"text-uppercase text-h6 font-weight-bold mb-1 text-left"},[e._v("MANTENTE EN CONTACTO CON NOSOTROS")]),t("v-responsive",{staticClass:"base-divider primary mr-auto mb-6",staticStyle:{"max-width":"28px"}},[t("v-divider",{staticClass:"theme--light",attrs:{role:"separator","aria-orientation":"horizontal"}})],1)],1)],1)],1),t("div",[t("div",{staticClass:"pt-2 mb-0 d-flex"},[t("div",{staticClass:"d-inline-flex mb-3 align-self-start"},[t("v-avatar",{staticClass:"grey lighten-2",attrs:{size:"72"}},[t("v-icon",{attrs:{size:"36",color:"secondary "}},[e._v("mdi-map-marker")])],1)],1),t("div",{staticClass:"d-flex justify-center align-center"},[t("div",{staticClass:"d-inline ml-3"},[t("h4",{staticClass:"text-left text-h6 mb-1 secondary--text"},[e._v("Vis\xEDtanos")]),t("p",{staticClass:"text-body-1 grey--text text--darken-1 text-left mb-0"},[e._v("Calle 10 39-30, Esperanza 3ra etapa")])])])]),t("v-divider",{staticClass:"my-2"}),t("div",{staticClass:"pt-2 mb-0 d-flex"},[t("div",{staticClass:"base-avatar d-inline-flex mb-3 align-self-start"},[t("v-avatar",{staticClass:"grey lighten-2",attrs:{size:"72"}},[t("v-icon",{attrs:{size:"36",color:"secondary "}},[e._v("mdi-cellphone")])],1)],1),t("div",{staticClass:"d-flex flex-column justify-center align-center"},[t("div",{staticClass:"d-inline ml-3"},[t("h4",{staticClass:"text-left text-h6 mb-1 secondary--text"},[e._v("Ll\xE1manos")]),t("a",{staticClass:"base-body text-body-1 mx-auto grey--text text--darken-1 text-left mb-0",attrs:{href:"tel:3138161129"}},[e._v("+57 3138161129")]),t("span",{staticClass:"base-body text-body-1 mx-auto grey--text text--darken-1 px-2"},[e._v("-")]),t("a",{staticClass:"base-body text-body-1 mx-auto grey--text text--darken-1 text-left mb-0",attrs:{href:"tel:3504944938"}},[e._v("+57 3504944938")])])])]),t("hr",{staticClass:"my-2 v-divider theme--light",attrs:{role:"separator","aria-orientation":"horizontal"}}),t("div",{staticClass:"pt-2 mb-0 d-flex align-center"},[t("div",{staticClass:"base-avatar d-inline-flex mb-3 align-self-start"},[t("v-avatar",{staticClass:"grey lighten-2",attrs:{size:"72"}},[t("v-icon",{attrs:{size:"36",color:"secondary "}},[e._v("mdi-email")])],1)],1),t("div",{staticClass:"d-flex flex-column justify-center align-center"},[t("div",{staticClass:"d-inline ml-3"},[t("h4",{staticClass:"text-left text-h6 mb-1 secondary--text"},[e._v("Escr\xEDbenos")]),t("a",{staticClass:"text-body-1 grey--text text--darken-1 mb-0",attrs:{href:"mailto:informacion@ceindetec.org.co"}},[e._v("informacion@ceindetec.org.co")])])])])],1)],1)]),t("v-col",{staticClass:"col-md-6 col-12"},[t("v-card",{staticClass:"map-responsive",attrs:{outlined:""}},[t("iframe",{staticStyle:{border:"0"},attrs:{src:"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3979.432202889012!2d-73.62601908588987!3d4.13506119699349!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3e2e71607f7927%3A0xc91b0a322b3e364b!2sCEINDETEC+Llanos!5e0!3m2!1ses-419!2sco!4v1542985312780",width:"100%",height:"400px",frameborder:"0",allowfullscreen:""}})])],1),t("v-col",{staticClass:"col-12 d-flex justify-center"},[t("div",[t("v-container",{staticClass:"container pa-0",attrs:{space:"4"}},[t("v-row",{staticClass:"row no-gutters justify-start"},[t("v-col",{staticClass:"col col-12"},[t("h3",{staticClass:"text-uppercase text-h6 font-weight-bold mb-1 text-left"},[e._v("ENV\xCDENOS SU MENSAJE")]),t("div",{staticClass:"v-responsive base-divider primary mr-auto mb-6",staticStyle:{"max-width":"28px"}},[t("div",{staticClass:"v-responsive__content"},[t("hr",{staticClass:"v-divider theme--light",attrs:{role:"separator","aria-orientation":"horizontal"}})])])])],1)],1),t("v-form",{ref:"form",staticClass:"pa-5",attrs:{"lazy-validation":!1},on:{submit:function(a){return a.preventDefault(),e.enviar(e.mail)}},model:{value:e.valid,callback:function(a){e.valid=a},expression:"valid"}},[t("v-card",{attrs:{outlined:""}},[t("v-card-text",[t("v-row",[t("v-col",[t("v-text-field",{attrs:{dense:"",label:"Nombre",outlined:""},model:{value:e.mail.name,callback:function(a){e.$set(e.mail,"name",a)},expression:"mail.name"}})],1),t("v-col",[t("v-text-field",{attrs:{dense:"",label:"Email",outlined:""},model:{value:e.mail.email,callback:function(a){e.$set(e.mail,"email",a)},expression:"mail.email"}})],1)],1),t("v-text-field",{attrs:{dense:"",label:"Asunto",outlined:""},model:{value:e.mail.subject,callback:function(a){e.$set(e.mail,"subject",a)},expression:"mail.subject"}}),t("v-textarea",{attrs:{dense:"",label:"Descripci\xF3n del mensaje",outlined:""},model:{value:e.mail.content,callback:function(a){e.$set(e.mail,"content",a)},expression:"mail.content"}}),t("div",{staticClass:"d-flex justify-center"},[t("v-btn",{staticClass:"font-weight-bold",attrs:{color:"secondary",dark:""},on:{click:e.validate}},[e._v(" Enviar mensaje ")])],1)],1)],1)],1)],1)])],1)],1)],1),t("spinner-component",{attrs:{value:e.overlay,color:"primary",opacity:.9}})],1)},m=[],v=n(c,d,m,!1,null,"9d1335a3",null,null);const w=v.exports;export{w as default};
