import{A as a}from"./AppLayout.d8256fea.js";import{B as l}from"./BreadCrumbs.14245490.js";import{V as i}from"./vue2-editor.esm.b661da6c.js";import{n as c}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.b2b49248.js";import"./app.7acbb6e1.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.da80baee.js";const n={name:"CreateTicket",components:{BreadCrumbs:l,AppLayout:a,VueEditor:i},props:["categories"],data(){return{form:this.$inertia.form({user_id:"",category_id:"",ticket_id:"",title:"",priority:"",message:"",status:""}),links:[{text:"Dashboard",disabled:!1,href:"/dashboard"},{text:"Tickets",disabled:!1,href:"/dashboard/ticket"},{text:"Crear Ticket",disabled:!0,href:""}]}},methods:{regresar(){this.$inertia.get("/dashboard/ticket")},save(){this.form.post("/dashboard/ticket",this.form,{preserveScroll:!0,onSuccess:o=>{console.log(o)}})}}};var m=function(){var e=this,r=e._self._c;return r("app-layout",[r("bread-crumbs",{attrs:{items:e.links,name:"Abrir Ticket"}}),r("v-container",[r("v-col",{staticClass:"mx-auto col-md-10 cols-12"},[r("v-form",{on:{submit:function(t){return t.preventDefault(),e.save()}}},[r("v-card",[r("v-card-text",[r("v-row",[r("v-col",{staticClass:"col-sm-12 col-md-6"},[r("v-text-field",{attrs:{value:e.$page.props.user.name,disabled:"",label:"Nombre",outlined:"",readonly:""}})],1),r("v-col",{staticClass:"col-sm-12 col-md-6"},[r("v-text-field",{attrs:{value:e.$page.props.user.email,disabled:"",label:"Direcci\xF3n de email",outlined:"",readonly:""}})],1),r("v-col",{staticClass:"col-sm-12 col-md-12"},[r("v-text-field",{attrs:{"error-messages":e.form.errors.title,label:"Titulo",outlined:""},on:{blur:function(t){return e.form.clearErrors("title")}},model:{value:e.form.title,callback:function(t){e.$set(e.form,"title",t)},expression:"form.title"}})],1),r("v-col",{staticClass:"col-sm-12 col-md-6"},[r("v-autocomplete",{attrs:{"error-messages":e.form.errors.category_id,items:e.categories,"item-text":"name","item-value":"id",label:"Categor\xEDa",outlined:""},on:{blur:function(t){return e.form.clearErrors("category_id")}},model:{value:e.form.category_id,callback:function(t){e.$set(e.form,"category_id",t)},expression:"form.category_id"}})],1),r("v-col",{staticClass:"col-sm-12 col-md-6"},[r("v-autocomplete",{attrs:{"error-messages":e.form.errors.priority,items:["Alta","Media","Baja"],label:"Prioridad",outlined:""},on:{blur:function(t){return e.form.clearErrors("priority")}},model:{value:e.form.priority,callback:function(t){e.$set(e.form,"priority",t)},expression:"form.priority"}})],1),r("v-col",{staticClass:"col-sm-12 col-md-12"},[r("v-input",{attrs:{label:"Mensaje"}}),r("vue-editor",{ref:"myTextEditor",staticClass:"theme--light v-text-field v-text-field--is-booted v-text-field--enclosed v-text-field--outlined",style:e.form.errors.message?"border:solid 2px red; border-radius: 4px":"border-radius: 6px",attrs:{outlined:"",placeholder:"Mensaje del ticket"},on:{blur:function(t){return e.form.clearErrors("message")}},model:{value:e.form.message,callback:function(t){e.$set(e.form,"message",t)},expression:"form.message"}}),r("v-input",{attrs:{"error-messages":e.form.errors.message}})],1),r("v-col",[r("v-file-input",{attrs:{"prepend-icon":null,"show-size":1e3,color:"primary",counter:"",label:"Adjuntar archivo",multiple:"",outlined:"",placeholder:"Select your files","prepend-inner-icon":"mdi-paperclip"},scopedSlots:e._u([{key:"selection",fn:function({index:t,text:s}){return[t<2?r("v-chip",{attrs:{color:"secondary",dark:"",label:"",small:""}},[e._v(" "+e._s(s)+" ")]):t===2?r("span",{staticClass:"text-overline grey--text text--darken-3 mx-2"},[e._v(" +"+e._s(e.files.length-2)+" File(s) ")]):e._e()]}}])})],1)],1)],1),r("v-card-actions",{staticClass:"d-flex justify-center align-center"},[r("v-btn",{staticClass:"primary",attrs:{disabled:e.form.processing,type:"submit"}},[e._v("Enviar")]),r("v-btn",{staticClass:"secondary",on:{click:function(t){return e.regresar()}}},[e._v("Cancelar")])],1)],1)],1)],1)],1)],1)},d=[],u=c(n,m,d,!1,null,"214d9cb0",null,null);const k=u.exports;export{k as default};
