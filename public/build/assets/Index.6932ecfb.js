import{A as i}from"./AppLayout.7e6a42a7.js";import{B as o}from"./BreadCrumbs.14245490.js";import{V as n}from"./vue2-editor.esm.e0ba3048.js";import{n as l}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.69c5493d.js";import"./app.77aa44cf.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.da80baee.js";const c={components:{AppLayout:i,BreadCrumbs:o,VueEditor:n},props:["data","errors"],data(){return{saving:!1,valid:!1,menu1:!1,menu2:!1,establishments:[],studyPlans:[],editMode:!1,isOpen:!1,search:"",rules:{required:r=>!!r||"Campo requerido.",max:r=>r.length<=20||"M\xE1ximo 20 caracteres",min:r=>r.length>=10||"M\xEDnimo 10 caracteres",email:r=>/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(r)||"Invalid e-mail.",phone:r=>/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/.test(r)||"Numero telef\xF3nico invalido.",text:r=>/^\s+$/.test(r)||"Solo caracteres alfab\xE9ticos.",number:r=>/^\d+$/.test(r)||"solo caracteres num\xE9ricos."},form:{name:null,description:null},headers:[{text:"Id",align:"start",sortable:!1,value:"id"},{text:"Nombre",value:"name"},{text:"Descripci\xF3n",value:"description"},{text:"Acciones",value:"actions",sortable:!1}],editedIndex:-1,editedItem:{name:null,description:null},defaultItem:{name:null,description:null},items:[{text:"Dashboard",disabled:!1,href:"dashboard"},{text:"Asignaturas ",disabled:!0,href:"asignaturas .index"}],customToolbar:[[{font:[]}],[{header:[!1,1,2,3,4,5,6]}],[{size:["small",!1,"large","huge"]}],["bold","italic","underline","strike"],[{align:""},{align:"center"},{align:"right"},{align:"justify"}],[{header:1},{header:2}],["blockquote","code-block"],[{list:"ordered"},{list:"bullet"},{list:"check"}],[{script:"sub"},{script:"super"}],[{indent:"-1"},{indent:"+1"}],[{color:[]},{background:[]}],["link","formula"],[{direction:"rtl"}],["clean"]],management:[{title:"Editar",icon:"mdi-playlist-edit",route:"area.index"},{title:"Eliminar",icon:"mdi-playlist-remove",route:"area.index"},{title:"Crear",icon:"mdi-playlist-plus",route:"area.index"},{title:"Salir",icon:"mdi-close",route:"area.index"}]}},methods:{validate(){this.$refs.form.validate()},ConvertStringToHTML(r){return new DOMParser().parseFromString(r,"text/html").body.innerText},getActualYear(){return new Date(Date.parse(`${new Date().getFullYear().toString()}-01-01`)).toISOString().slice(0,7)},create:function(){this.editMode=!1,this.openModal()},edit:function(r){this.form=Object.assign({},r),this.editMode=!0,this.openModal()},openModal:function(){this.isOpen=!0},closeModal:function(){this.isOpen=!1,this.reset(),this.editMode=!1},reset:function(){this.form=this.defaultItem,this.resetValidation()},resetValidation(){this.$refs.form.resetValidation()},save:function(r){this.saving=!0,!this.validate()&&!this.valid?(this.$swal.fire("Campos Obligatorio!","Ingresa los campos obligatorios!","error"),this.saving=!1):this.$inertia.post(this.route("area.store"),r,{onSuccess:t=>{t.data,console.log(t),console.log("errors => ",this.$page.errors),this.$swal({icon:`${this.$page.errors.name?"error":"success"}`,title:`${this.$page.errors.name?"Ups...":"\xA1Buen trabajo!"}`,text:`${this.$page.errors.name?this.$page.errors.name[0]:this.$page.flash.message}`}).then(e=>{this.saving=!1,e.isConfirmed&&(this.headquarters=this.defaultHeadquarters,this.reset(),this.resetValidation(),this.$inertia.get(this.route("area.index")))})},onError:t=>{this.saving=!1;const e=t.response.data.errors;let s="";for(var a in e)s+=a+": "+e[a]+`
 `;this.$swal.fire("Error!",s,"error"),console.log(s)},onFinish:t=>{this.saving=!1}})},update:function(r){r._method="PUT",this.$inertia.post(this.route("area.update",r.id),r,{onSuccess:t=>{this.$swal({icon:`${t.props.errors.message?"error":"success"}`,title:`${t.props.errors.message?"Ups...":"\xA1Buen trabajo!"}`,text:`${t.props.errors.message?t.props.errors.message:t.props.flash.message}`}),this.reset(),this.closeModal()},onError:t=>{this.reset(),this.closeModal()},onFinish:t=>{this.reset(),this.closeModal(),this.editMode=!1}})},deleteRow(r){r._method="DELETE",this.$swal({title:"\xBFEst\xE1 seguro de que desea eliminar este elemento?",text:"\xA1No podr\xE1s revertir esto!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"S\xED, Eliminarlo!"}).then(t=>{t.isConfirmed&&this.$inertia.post(this.route("area.destroy",r.id),r,{onStart:e=>{this.loadingDeleteItem=!0},onSuccess:e=>{console.log("estamos eliminando la info",e),this.$swal({icon:`${e.props.errors.message?"error":"success"}`,title:`${e.props.errors.message?"Ups...":"\xA1Buen trabajo!"}`,text:`${e.props.errors.message?e.props.errors.message:e.props.flash.message}`})},onError:e=>{this.$swal("\xA1Ay...!","Disculpe, ocurri\xF3 un error.","warning")},onFinish:e=>{this.loadingDeleteItem=!1}})})},initialize(){this.$inertia.get(this.route("area.index"))}}};var d=function(){var t=this,e=t._self._c;return e("app-layout",[e("bread-crumbs",{attrs:{name:"Asignaturas ",items:t.items}}),e("v-container",{staticClass:"py-12"},[e("v-row",{staticClass:"ma-0"},[e("v-col",[e("v-card",{staticStyle:{width:"100%"}},[e("v-card-text",{},[e("v-row",{staticClass:"no-gutters"},[e("div",{staticClass:"d-flex justify-space-between justify-md-start col-md-6 col-12"},[e("v-btn",{staticClass:"mr-3 success",on:{click:function(s){return t.create()}}},[e("v-icon",{staticClass:"notranslate mr-2"},[t._v(" mdi-plus ")]),t._v(" Add ")],1),e("v-btn",{staticClass:"button-shadow primary--text",attrs:{outlined:""}},[e("v-icon",{staticClass:"notranslate mr-2",attrs:{"aria-hidden":"true"}},[t._v(" mdi-filter-variant ")]),t._v(" Filters ")],1)],1),e("v-spacer"),e("div",{staticClass:"mx-auto mt-4 mt-md-0",staticStyle:{"max-width":"250px"}},[e("v-text-field",{attrs:{"hide-details":"",dense:"",enclosed:"",outlined:"","append-icon":"mdi-magnify",placeholder:"search"},model:{value:t.search,callback:function(s){t.search=s},expression:"search"}})],1)],1)],1)],1)],1)],1),e("v-row",{staticClass:"ma-0"},[e("v-col",[e("v-card",{staticStyle:{width:"100%"}},[e("v-data-table",{staticClass:"elevation-1",attrs:{headers:t.headers,items:t.data,"sort-by":"calories",search:t.search},scopedSlots:t._u([{key:"item.description",fn:function({item:s}){return[t._v(" "+t._s(t.ConvertStringToHTML(s.description))+" ")]}},{key:"item.actions",fn:function({item:s}){return[e("v-icon",{staticClass:"mr-2",attrs:{small:""},on:{click:function(a){return t.edit(s)}}},[t._v(" mdi-pencil-outline ")]),e("v-icon",{attrs:{small:""},on:{click:function(a){return t.deleteRow(s)}}},[t._v(" mdi-delete-outline ")])]}},{key:"no-data",fn:function(){return[e("v-btn",{attrs:{color:"primary"},on:{click:t.initialize}},[t._v(" Reset ")])]},proxy:!0}])})],1)],1)],1)],1),e("v-dialog",{staticStyle:{"z-index":"9"},attrs:{"max-width":"800",fullscreen:"","hide-overlay":"",transition:"dialog-bottom-transition",scrollable:""},model:{value:t.isOpen,callback:function(s){t.isOpen=s},expression:"isOpen"}},[e("v-card",{staticClass:"min-h-screen",attrs:{tile:"",color:"grey lighten-4"}},[e("v-toolbar",{staticStyle:{"max-height":"150px"},attrs:{flat:"",dark:"",color:"primary"}},[e("v-btn",{attrs:{icon:"",dark:""},on:{click:function(s){t.isOpen=!1}}},[e("v-icon",[t._v("mdi-close")])],1),e("v-toolbar-title",{staticClass:"text-h5 white--text"},[t._v("Gesti\xF3n de asignaturas")]),e("v-spacer"),e("v-menu",{attrs:{bottom:"",right:"","offset-y":""},scopedSlots:t._u([{key:"activator",fn:function({on:s,attrs:a}){return[e("v-btn",t._g(t._b({attrs:{dark:"",icon:""}},"v-btn",a,!1),s),[e("v-icon",[t._v("mdi-dots-vertical")])],1)]}}])},[e("v-list",{attrs:{dense:""}},t._l(t.management,function(s,a){return e("inertia-link",{key:a,attrs:{href:t.route(s.route)}},[e("v-list-item",{attrs:{link:""}},[e("v-list-item-icon",[e("v-icon",[t._v(t._s(s.icon))])],1),e("v-list-item-title",[t._v(t._s(s.title))])],1)],1)}),1)],1)],1),e("v-container",[e("v-form",{ref:"form",model:{value:t.valid,callback:function(s){t.valid=s},expression:"valid"}},[e("v-card",{staticClass:"mt-12"},[e("v-card-title",{staticClass:"align-start"},[e("v-card",{staticClass:"overflow-hidden mt-n9 transition-swing elevation-6 rounded primary fixed",staticStyle:{"max-width":"100%"}},[e("div",{staticClass:"pa-8"},[e("v-icon",{attrs:{dark:"",size:"36"}},[t._v("mdi-book-multiple")])],1)]),e("div",{staticClass:"text-h5 pl-4"},[t._v(" "+t._s(t.editMode!==!1?"Editar asignatura":"Crear nueva asignatura")+" ")])],1),e("v-card-text",[e("v-row",[e("v-col",{staticClass:"col-12"},[e("v-text-field",{attrs:{outlined:"",counter:50,label:"Nombre",rules:[t.rules.required]},model:{value:t.form.name,callback:function(s){t.$set(t.form,"name",s)},expression:"form.name"}}),t.$page.errors.title?e("div",{staticClass:"text-red-500"},[t._v(" "+t._s(t.$page.errors.title[0])+" ")]):t._e()],1),e("v-col",{staticClass:"col-12"},[e("v-label",{staticClass:"mb-4",attrs:{for:"myTextEditor"}},[t._v("Descripci\xF3n")]),e("div",{staticClass:"py-2"},[e("vue-editor",{ref:"myTextEditor",attrs:{"editor-toolbar":t.customToolbar,rules:[t.rules.required]},model:{value:t.form.description,callback:function(s){t.$set(t.form,"description",s)},expression:"form.description"}})],1),t.$page.errors.starts_at?e("div",{staticClass:"text-red-500"},[t._v(" "+t._s(t.$page.errors.starts_at[0])+" ")]):t._e()],1)],1),e("div",{staticClass:"d-flex justify-end"},[e("v-btn",{directives:[{name:"show",rawName:"v-show",value:!t.editMode,expression:"!editMode"}],staticClass:"primary mx-1",attrs:{"wire:click.prevent":"store()",type:"button",dark:""},on:{click:function(s){return t.save(t.form)}}},[t._v(" Guardar ")]),e("v-btn",{directives:[{name:"show",rawName:"v-show",value:t.editMode,expression:"editMode"}],staticClass:"primary x-1",attrs:{"wire:click.prevent":"store()",type:"button",dark:""},on:{click:function(s){return t.update(t.form)}}},[t._v(" Actualizar ")]),e("v-btn",{staticClass:"secondary mx-1",attrs:{type:"button",dark:""},on:{click:function(s){return t.closeModal()}}},[t._v(" Cancelar ")])],1)],1)],1)],1)],1)],1)],1)],1)},u=[],m=l(c,d,u,!1,null,null,null,null);const y=m.exports;export{y as default};