import{A as i}from"./AppLayout.6bdcf6d9.js";import{B as a}from"./BreadCrumbs.14245490.js";import{V as l}from"./vue2-editor.esm.74281c15.js";import{V as n}from"./app.5491753d.js";import{n as m}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.38fe6699.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.da80baee.js";const c={name:"CreateTicket",components:{BreadCrumbs:a,AppLayout:i,VueEditor:l},data(){return{form:this.$inertia.form({user_id:"",category_id:"",title:"",priority:"",message:"",status:"Active",resource:"",line:"",resources:[],establishment_id:"",headquarter_id:""}),lines:[{name:"Conectividad",icon:"mdi-radio-tower"},{name:"Paneles Solares",icon:"mdi-solar-power-variant "},{name:"Hidropaneles",icon:"mdi-solar-panel"}],links:[{text:"Dashboard",disabled:!1,href:"/dashboard"},{text:"Tickets",disabled:!1,href:"/dashboard/ticket"},{text:"Crear Ticket",disabled:!0,href:""}],establishments:[],headquarters:[],priorities:[{name:"Alta",icon:"mdi-arrow-up-bold"},{name:"Media",icon:"mdi-format-vertical-align-center"},{name:"Baja",icon:"mdi-arrow-down-bold"}],categories:[],menu2:null}},created(){axios.get("/dashboard/establishment/all").then(s=>{this.establishments=s.data}),axios.get("/dashboard/ticket-category/all").then(s=>{this.categories=s.data}),this.editMode===!0&&this.$nextTick(()=>{this.form.reset(),this.form=this.$inertia.form(this.incomeExpense),this.getAllHeadquarters()})},computed:{filteredCategories(){return this.categories.filter(s=>s.line===this.form.line)}},methods:{showToast(){n.swal.fire({title:"\xA1Notificaci\xF3n!",text:"Esto es una notificaci\xF3n de SweetAlert2",icon:"success",timer:3e3})},regresar(){this.$inertia.get("/dashboard/ticket")},save(){this.$inertia.post(route("ticket.store"),this.form,{onSuccess:s=>{console.log("response",s),s.props.flash.message?this.$swal("Buen trabajo!",s.props.flash.message,"success"):this.$swal("Mensaje personalizado","El mensaje de flash es nulo","warning"),this.reset()},onError:s=>{console.log("error",s);let e="Ups... Ha ocurrido un error.";s.response&&s.response.data&&s.response.data.errors&&(e=Object.values(s.response.data.errors).join("<br>")),this.$swal.fire({icon:"error",title:"Ups...",html:e})}})},reset(){this.$refs.form.resetValidation(),this.$refs.form.reset(),this.form.reset()},getAllHeadquarters(){let s=this.form.establishment_id;console.log(this.form.establishment_id),console.log(s),s!==null&&axios.get(`/dashboard/establishment/${s}/headquarters`).then(e=>{this.headquarters=e.data}).catch(e=>{console.log(e)})}}};var d=function(){var e=this,t=e._self._c;return t("app-layout",[t("bread-crumbs",{attrs:{items:e.links,name:"Abrir Ticket"}}),t("v-container",[t("v-col",{staticClass:"mx-auto col-md-10 cols-12"},[t("v-form",{ref:"form",on:{submit:function(r){return r.preventDefault(),e.save()}}},[t("v-card",[t("v-card-text",[t("v-row",[t("v-col",{staticClass:"col-sm-12 col-md-6"},[t("v-text-field",{attrs:{value:e.$page.props.user.name,disabled:"",label:"Nombre",outlined:"",readonly:""}})],1),t("v-col",{staticClass:"col-sm-12 col-md-6"},[t("v-text-field",{attrs:{value:e.$page.props.user.email,disabled:"",label:"Direcci\xF3n de email",outlined:"",readonly:""}})],1),t("v-col",{staticClass:"col-12 col-sm-6"},[t("v-autocomplete",{attrs:{disabled:e.establishments.length<-1,"error-messages":e.form.errors.establishment_id,items:e.establishments,readonly:e.establishments.length<-1,"item-text":"name","item-value":"id",label:"Establecimiento",outlined:""},on:{change:e.getAllHeadquarters},model:{value:e.form.establishment_id,callback:function(r){e.$set(e.form,"establishment_id",r)},expression:"form.establishment_id"}})],1),t("v-col",{staticClass:"col-12 col-sm-6"},[t("v-autocomplete",{attrs:{disabled:e.headquarters.length<-1,"error-messages":e.form.errors.headquarter_id,items:e.headquarters,readonly:e.form.establishment_id===null||e.form.establishment_id==="","item-text":"name","item-value":"id",label:"Sede",outlined:""},model:{value:e.form.headquarter_id,callback:function(r){e.$set(e.form,"headquarter_id",r)},expression:"form.headquarter_id"}})],1),t("v-col",{staticClass:"col-sm-12 col-md-5"},[t("v-autocomplete",{attrs:{"error-messages":e.form.errors.line,items:e.lines,"item-text":"name","item-value":"name",label:"Linea a la cual pertenece la operaci\xF3n",outlined:""},on:{blur:function(r){return e.form.clearErrors("line")}},scopedSlots:e._u([{key:"item",fn:function(r){return[typeof r.item!="object"?[t("v-list-item-content",{domProps:{textContent:e._s(r.item)}})]:[t("v-list-item-avatar",[t("v-icon",[e._v(" "+e._s(r.item.icon)+" ")])],1),t("v-list-item-title",{domProps:{innerHTML:e._s(r.item.name)}})]]}}]),model:{value:e.form.line,callback:function(r){e.$set(e.form,"line",typeof r=="string"?r.trim():r)},expression:"form.line"}})],1),t("v-col",{staticClass:"col-sm-12 col-md-4"},[t("v-autocomplete",{attrs:{disabled:e.form.line===""||e.form.line===null,"error-messages":e.form.errors.category_id,items:e.filteredCategories,"item-text":"name","item-value":"id",label:"Categor\xEDa",outlined:""},on:{blur:function(r){return e.form.clearErrors("category_id")}},model:{value:e.form.category_id,callback:function(r){e.$set(e.form,"category_id",r)},expression:"form.category_id"}})],1),t("v-col",{staticClass:"col-sm-12 col-md-3"},[t("v-autocomplete",{attrs:{"error-messages":e.form.errors.priority,items:e.priorities,"item-text":"name","item-value":"name",label:"Prioridad",outlined:""},on:{blur:function(r){return e.form.clearErrors("priority")}},scopedSlots:e._u([{key:"item",fn:function(r){return[typeof r.item!="object"?[t("v-list-item-content",{domProps:{textContent:e._s(r.item)}})]:[t("v-list-item-avatar",[t("v-icon",[e._v(" "+e._s(r.item.icon)+" ")])],1),t("v-list-item-title",{domProps:{innerHTML:e._s(r.item.name)}})]]}}]),model:{value:e.form.priority,callback:function(r){e.$set(e.form,"priority",r)},expression:"form.priority"}})],1),t("v-col",{staticClass:"col-sm-12 col-md-12"},[t("v-text-field",{attrs:{"error-messages":e.form.errors.title,label:"Titulo",outlined:""},on:{blur:function(r){return e.form.clearErrors("title")}},model:{value:e.form.title,callback:function(r){e.$set(e.form,"title",r)},expression:"form.title"}})],1),t("v-col",{staticClass:"col-sm-12 col-md-12"},[t("v-input",{attrs:{label:"Mensaje"}}),t("vue-editor",{ref:"myTextEditor",staticClass:"theme--light v-text-field v-text-field--is-booted v-text-field--enclosed v-text-field--outlined",style:e.form.errors.message?"border:solid 2px red; border-radius: 4px":"border-radius: 6px",attrs:{outlined:"",placeholder:"Mensaje del ticket"},on:{blur:function(r){return e.form.clearErrors("message")}},model:{value:e.form.message,callback:function(r){e.$set(e.form,"message",r)},expression:"form.message"}}),t("v-input",{attrs:{"error-messages":e.form.errors.message}})],1),t("v-col",{staticClass:"col-12 col-sm-12"},[t("v-file-input",{attrs:{"prepend-icon":null,"show-size":1e3,color:"primary",counter:"",label:"Adjuntar archivos",multiple:"",outlined:"","prepend-inner-icon":"mdi-paperclip"},scopedSlots:e._u([{key:"selection",fn:function({index:r,text:o}){return[t("v-chip",{attrs:{color:"secondary",dark:"",label:"",small:""}},[e._v(" "+e._s(o)+" ")])]}}]),model:{value:e.form.resources,callback:function(r){e.$set(e.form,"resources",r)},expression:"form.resources"}}),e._v(" "+e._s(e.form.resources)+" ")],1)],1)],1),t("v-card-actions",{staticClass:"d-flex justify-center align-center"},[t("v-btn",{staticClass:"primary",attrs:{disabled:e.form.processing,type:"submit"}},[e._v("Enviar ")]),t("v-btn",{staticClass:"secondary",on:{click:function(r){return e.regresar()}}},[e._v("Cancelar ")])],1)],1)],1)],1),t("v-btn",{on:{click:e.showToast}},[e._v("Mostrar toast")])],1)],1)},u=[],f=m(c,d,u,!1,null,"0ad12edb",null,null);const C=f.exports;export{C as default};
