import{A as i}from"./AppLayout.9de32e63.js";import{B as o}from"./BreadCrumbs.14245490.js";import{n}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.c6242de4.js";import"./app.2206ab69.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.af9b0a02.js";const l={components:{AppLayout:i,BreadCrumbs:o},props:["data","errors"],data(){return{saving:!1,valid:!1,menu1:!1,menu2:!1,establishments:[],years:[],editMode:!1,isOpen:!1,search:"",rules:{required:s=>!!s||"Campo requerido.",max:s=>s.length<=20||"M\xE1ximo 20 caracteres",min:s=>s.length>=10||"M\xEDnimo 10 caracteres",email:s=>/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(s)||"Invalid e-mail.",phone:s=>/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/.test(s)||"Numero telef\xF3nico invalido.",text:s=>/^\s+$/.test(s)||"Solo caracteres alfab\xE9ticos.",number:s=>/^\d+$/.test(s)||"solo caracteres num\xE9ricos."},form:{name:null,establishments_id:null,year_id:null},headers:[{text:"Id",align:"start",sortable:!1,value:"id"},{text:"Nombre",value:"name"},{text:"Establecimiento",value:"establishments_id"},{text:"A\xF1o lectivo",value:"year_id"},{text:"Acciones",value:"actions",sortable:!1}],editedIndex:-1,editedItem:{name:null,establishments_id:null,year_id:null},defaultItem:{name:null,establishments_id:null,year_id:null},items:[{text:"Dashboard",disabled:!1,href:"dashboard"},{text:"Plan de estudio",disabled:!0,href:"study-plans.index"}]}},created(){axios.get("/dashboard/establishment/all").then(s=>{this.establishments=s.data}),axios.get("/dashboard/year/all").then(s=>{this.years=s.data})},methods:{validate(){this.$refs.form.validate()},getActualYear(){return new Date(Date.parse(`${new Date().getFullYear().toString()}-01-01`)).toISOString().slice(0,7)},openModal:function(){this.isOpen=!0},closeModal:function(){this.isOpen=!1,this.reset(),this.editMode=!1},reset:function(){this.form=this.defaultItem},resetValidation(){this.$refs.form.resetValidation()},save:function(s){this.saving=!0,!this.validate()&&!this.valid?(this.$swal.fire("Campos Obligatorio!","Ingresa los campos obligatorios!","error"),this.saving=!1):this.$inertia.post(this.route("study-plans.store"),s,{onSuccess:e=>{e.data,console.log(e),console.log("errors => ",this.$page.errors),this.$swal({icon:`${this.$page.errors.name?"error":"success"}`,title:`${this.$page.errors.name?"Ups...":"\xA1Buen trabajo!"}`,text:`${this.$page.errors.name?this.$page.errors.name[0]:this.$page.flash.message}`}).then(t=>{this.saving=!1,t.isConfirmed&&(this.headquarters=this.defaultHeadquarters,this.reset(),this.resetValidation(),this.$inertia.get(this.route("study-plans.index")))})},onError:e=>{this.saving=!1;const t=e.response.data.errors;let a="";for(var r in t)a+=r+": "+t[r]+`
 `;this.$swal.fire("Error!",a,"error"),console.log(a)},onFinish:e=>{this.saving=!1}})},edit:function(s){this.form=Object.assign({},s),this.editMode=!0,this.openModal()},update:function(s){s._method="PUT",this.$inertia.post(this.route("study-plans.update",s.id),s,{onSuccess:e=>{this.$swal({icon:`${e.props.errors.message?"error":"success"}`,title:`${e.props.errors.message?"Ups...":"\xA1Buen trabajo!"}`,text:`${e.props.errors.message?e.props.errors.message:e.props.flash.message}`}),this.reset(),this.closeModal()},onError:e=>{this.reset(),this.closeModal()},onFinish:e=>{this.reset(),this.closeModal()}})},deleteRow(s){s._method="DELETE",this.$swal({title:"\xBFEst\xE1 seguro de que desea eliminar este elemento?",text:"\xA1No podr\xE1s revertir esto!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"S\xED, Eliminarlo!"}).then(e=>{e.isConfirmed&&this.$inertia.post(this.route("study-plans.destroy",s.id),s,{onStart:t=>{this.loadingDeleteItem=!0},onSuccess:t=>{console.log("estamos eliminando la info",t),this.$swal({icon:`${t.props.errors.message?"error":"success"}`,title:`${t.props.errors.message?"Ups...":"\xA1Buen trabajo!"}`,text:`${t.props.errors.message?t.props.errors.message:t.props.flash.message}`})},onError:t=>{this.$swal("\xA1Ay...!","Disculpe, ocurri\xF3 un error.","warning")},onFinish:t=>{this.loadingDeleteItem=!1}})})},initialize(){this.$inertia.get(this.route("study-plans.index"))}}};var d=function(){var e=this,t=e._self._c;return t("app-layout",[t("bread-crumbs",{attrs:{name:"Plan de estudio",items:e.items}}),t("v-container",{staticClass:"py-12"},[t("v-row",{staticClass:"ma-0"},[t("v-col",[t("v-card",{staticStyle:{width:"100%"}},[t("v-card-text",{},[t("v-row",{staticClass:"no-gutters"},[t("div",{staticClass:"d-flex justify-space-between justify-md-start col-md-6 col-12"},[t("v-btn",{staticClass:"mr-3 success",on:{click:function(a){e.isOpen=!e.isOpen}}},[t("v-icon",{staticClass:"notranslate mr-2"},[e._v(" mdi-plus ")]),e._v(" Add ")],1),t("v-btn",{staticClass:"button-shadow primary--text",attrs:{outlined:""}},[t("v-icon",{staticClass:"notranslate mr-2",attrs:{"aria-hidden":"true"}},[e._v(" mdi-filter-variant ")]),e._v(" Filters ")],1)],1),t("v-spacer"),t("div",{staticClass:"mx-auto mt-4 mt-md-0",staticStyle:{"max-width":"250px"}},[t("v-text-field",{attrs:{"hide-details":"",dense:"",enclosed:"",outlined:"","append-icon":"mdi-magnify",placeholder:"search"},model:{value:e.search,callback:function(a){e.search=a},expression:"search"}})],1)],1)],1)],1)],1)],1),t("v-row",{staticClass:"ma-0"},[t("v-col",[t("v-card",{staticStyle:{width:"100%"}},[t("v-data-table",{staticClass:"elevation-1",attrs:{headers:e.headers,items:e.data,"sort-by":"calories",search:e.search},scopedSlots:e._u([{key:"item.actions",fn:function({item:a}){return[t("v-icon",{staticClass:"mr-2",attrs:{small:""},on:{click:function(r){return e.edit(a)}}},[e._v(" mdi-pencil-outline ")]),t("v-icon",{attrs:{small:""},on:{click:function(r){return e.deleteRow(a)}}},[e._v(" mdi-delete-outline ")])]}},{key:"no-data",fn:function(){return[t("v-btn",{attrs:{color:"primary"},on:{click:e.initialize}},[e._v(" Reset ")])]},proxy:!0}])})],1)],1)],1)],1),t("v-dialog",{attrs:{"max-width":"800"},model:{value:e.isOpen,callback:function(a){e.isOpen=a},expression:"isOpen"}},[t("v-form",{ref:"form",model:{value:e.valid,callback:function(a){e.valid=a},expression:"valid"}},[t("v-card",{staticClass:"pa-6"},[t("v-card-text",[t("v-row",[t("v-col",{staticClass:"col-12"},[t("v-text-field",{attrs:{counter:50,label:"Nombre",rules:[e.rules.required]},model:{value:e.form.name,callback:function(a){e.$set(e.form,"name",a)},expression:"form.name"}}),e.$page.errors.title?t("div",{staticClass:"text-red-500"},[e._v(e._s(e.$page.errors.title[0])+" ")]):e._e()],1),t("v-col",{staticClass:"col-12"},[t("v-select",{attrs:{items:e.establishments,"item-text":"name","item-value":"id",label:"Establecimiento al que pertenece",rules:[e.rules.required]},model:{value:e.form.establishments_id,callback:function(a){e.$set(e.form,"establishments_id",a)},expression:"form.establishments_id"}}),e.$page.errors.starts_at?t("div",{staticClass:"text-red-500"},[e._v(e._s(e.$page.errors.starts_at[0])+" ")]):e._e()],1),t("v-col",{staticClass:"col-12"},[t("v-select",{attrs:{items:e.years,"item-text":"name","item-value":"id",label:"A\xF1o lectivo",rules:[e.rules.required]},model:{value:e.form.year_id,callback:function(a){e.$set(e.form,"year_id",a)},expression:"form.year_id"}}),e.$page.errors.starts_at?t("div",{staticClass:"text-red-500"},[e._v(e._s(e.$page.errors.starts_at[0])+" ")]):e._e()],1)],1),t("div",{staticClass:"d-flex justify-end"},[t("v-btn",{directives:[{name:"show",rawName:"v-show",value:!e.editMode,expression:"!editMode"}],staticClass:"primary mx-1",attrs:{"wire:click.prevent":"store()",type:"button",dark:""},on:{click:function(a){return e.save(e.form)}}},[e._v(" Save ")]),t("v-btn",{directives:[{name:"show",rawName:"v-show",value:e.editMode,expression:"editMode"}],staticClass:"primary x-1",attrs:{"wire:click.prevent":"store()",type:"button",dark:""},on:{click:function(a){return e.update(e.form)}}},[e._v(" Update ")]),t("v-btn",{staticClass:"secondary mx-1",attrs:{type:"button",dark:""},on:{click:function(a){return e.closeModal()}}},[e._v(" Cancel ")])],1)],1)],1)],1)],1)],1)},c=[],m=n(l,d,c,!1,null,null,null,null);const $=m.exports;export{$ as default};
