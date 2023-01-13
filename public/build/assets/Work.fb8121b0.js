import{A as i}from"./AppLayout.8b323fb5.js";import{B as n}from"./BreadCrumbs.14245490.js";import{S as o}from"./SpinnerComponent.6d0b39d4.js";import{n as l}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.33aecf47.js";import"./app.0d9ad409.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.af9b0a02.js";const d={name:"Work",components:{AppLayout:i,BreadCrumbs:n,SpinnerComponent:o},props:["data","errors"],data(){return{saving:!1,editMode:!1,isOpen:!1,search:"",form:{id:null,name:null},items:[{text:"Dashboard",disabled:!1,href:"/dashboard"},{text:"Obras",disabled:!0,href:"#"}],dialog:!1,dialogDelete:!1,headers:[{text:"Id",align:"start",sortable:!1,value:"id"},{text:"Tipo de obra",value:"work_type"},{text:"Sede",value:"headquarters_id"},{text:"Establecimiento",value:"establishments_id"},{text:"Actions",value:"actions",sortable:!1}],desserts:[],establishments:[],headquarters:[],allHeadquarters:[],editedIndex:-1,editedItem:{work_type:null,coordinates:null,establishments_id:null,headquarters_id:null},defaultItem:{work_type:null,coordinates:null,establishments_id:null,headquarters_id:null},rules:{required:s=>!!s||"Campo requerido.",max:s=>s.length<=20||"M\xE1ximo 20 caracteres",min:s=>s.length>=10||"M\xEDnimo 10 caracteres",email:s=>/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(s)||"Invalid e-mail.",phone:s=>/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/.test(s)||"Numero telef\xF3nico invalido.",text:s=>/^\s+$/.test(s)||"Solo caracteres alfab\xE9ticos.",number:s=>/^\d+$/.test(s)||"solo caracteres num\xE9ricos."}}},created(){axios.get("/dashboard/establishment/all").then(s=>{this.establishments=s.data}).catch(s=>{console.log(s)}),axios.get("/dashboard/headquarters/all").then(s=>{this.allHeadquarters=s.data}).catch(s=>{console.log(s)})},computed:{formTitle(){return this.editedIndex===-1?"New Item":"Edit Item"}},watch:{dialog(s){s||this.close()}},methods:{getHeadquarters(){let s=this.editedItem.establishments_id;s!==null&&axios.get(`/dashboard/establishment/${s}/headquarters`).then(e=>{this.headquarters=e.data}).catch(e=>{console.log(e)})},getHeadquartersById(s){try{return this.allHeadquarters.find(t=>t.id===s).name}catch{return null}},getEstablishmentsById(s){try{return this.establishments.find(t=>t.id===s).name}catch{return null}},closeModal:function(){this.isOpen=!1,this.reset(),this.editMode=!1},reset(){this.$nextTick(()=>{this.editedItem=Object.assign({},this.defaultItem),this.editedIndex=-1})},editItem(s){this.editedIndex=this.data.indexOf(s),this.editedItem=Object.assign({},s),this.dialog=!0},deleteItem(s){s._method="DELETE",this.$swal({title:"\xBFEst\xE1 seguro de que desea eliminar este elemento?",text:"\xA1No podr\xE1s revertir esto!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"S\xED, Eliminarlo!"}).then(e=>{e.isConfirmed&&(this.$inertia.post(this.route("work.destroy",+s.id),s,{onStart:()=>{this.saving=!0},onSuccess:t=>{this.$swal({icon:`${t.props.errors.message?"error":"success"}`,title:`${t.props.errors.message?"Ups...":"\xA1Buen trabajo!"}`,text:`${t.props.errors.message?t.props.errors.message:t.props.flash.message}`})},onError:t=>{this.$swal("\xA1Ay...!","Disculpe, ocurri\xF3 un error.","warning")},onFinish:t=>{this.saving=!1}}),this.$nextTick(()=>{this.editedItem=Object.assign({},this.defaultItem),this.editedIndex=-1}))}),this.reset()},close(){this.dialog=!1,this.$nextTick(()=>{this.editedItem=Object.assign({},this.defaultItem),this.editedIndex=-1})},save(s){this.saving=!0,this.editedIndex===-1?this.$inertia.post(this.route("work.store",s.id),s,{onSuccess:e=>{this.$swal({icon:`${e.props.errors.name?"error":"success"}`,title:`${e.props.errors.name?"Oops...":"\xA1Buen trabajo!"}`,text:`${e.props.errors.name?e.props.errors.name[0]:e.props.flash.message}`})},onError:e=>{console.log(e),this.$swal({icon:"error",title:"Oops...",text:this.errors.errors.name[0]})},onFinish:()=>{this.saving=!1}}):this.$inertia.post(this.route("work.update",s.id),s,{onSuccess:e=>{this.$swal({icon:`${e.props.errors.name?"error":"success"}`,title:`${e.props.errors.name?"Oops...":"\xA1Buen trabajo!"}`,text:`${e.props.errors.name?e.props.errors.name[0]:e.props.flash.message}`})},onError:e=>{console.log(e),this.$swal({icon:"error",title:"Oops...",text:this.errors.errors.name[0]})},onFinish:()=>{this.saving=!1}}),this.reset(),this.closeModal(),this.editMode=!1,this.close()},initialize(){this.saving=!0,this.$inertia.get(this.route("work.index"),null,{onFinish:()=>{this.saving=!1}})}}};var c=function(){var e=this,t=e._self._c;return t("app-layout",[t("bread-crumbs",{attrs:{name:"Obras",items:e.items}}),t("v-container",{staticClass:"d-flex justify-center"},[t("v-card",[t("v-data-table",{staticClass:"elevation-1",attrs:{headers:e.headers,items:e.data,"sort-by":"calories",search:e.search},scopedSlots:e._u([{key:"top",fn:function(){return[t("v-toolbar",{attrs:{flat:""}},[t("v-text-field",{staticClass:"mr-3",attrs:{"append-icon":"mdi-magnify",label:"Search","single-line":"","hide-details":""},model:{value:e.search,callback:function(r){e.search=r},expression:"search"}}),t("v-divider",{staticClass:"mx-4",attrs:{inset:"",vertical:""}}),t("v-spacer"),t("v-dialog",{attrs:{"max-width":"800px"},scopedSlots:e._u([{key:"activator",fn:function({on:r,attrs:a}){return[t("v-btn",e._g(e._b({staticClass:"mb-2",attrs:{color:"primary",dark:""}},"v-btn",a,!1),r),[e._v(" New Item ")])]}}]),model:{value:e.dialog,callback:function(r){e.dialog=r},expression:"dialog"}},[t("v-card",[t("v-card-title",[t("span",{staticClass:"text-h5"},[e._v(e._s(e.formTitle))])]),t("v-card-text",[t("v-container",[t("v-row",[t("v-col",{staticClass:"col-12 col-sm-6"},[t("v-select",{attrs:{items:e.establishments,"item-text":"name","item-value":"id",label:"Establecimiento al que pertenece",rules:[e.rules.required]},on:{change:e.getHeadquarters},model:{value:e.editedItem.establishments_id,callback:function(r){e.$set(e.editedItem,"establishments_id",r)},expression:"editedItem.establishments_id"}})],1),t("v-col",{staticClass:"col-12 col-sm-6"},[t("v-select",{attrs:{disabled:e.editedItem.establishments_id===null,items:e.headquarters,"item-text":"name","item-value":"id",label:"Sede a la que pertenece",rules:[e.rules.required]},model:{value:e.editedItem.headquarters_id,callback:function(r){e.$set(e.editedItem,"headquarters_id",r)},expression:"editedItem.headquarters_id"}})],1),t("v-col",{attrs:{cols:"12"}},[t("v-select",{attrs:{items:["Adecuaci\xF3n","Construcci\xF3n"],label:"Tipo de obra",rules:[e.rules.required]},model:{value:e.editedItem.work_type,callback:function(r){e.$set(e.editedItem,"work_type",r)},expression:"editedItem.work_type"}})],1),t("v-col",{attrs:{cols:"12"}},[t("v-textarea",{attrs:{label:"Coordenadas",rules:[e.rules.required]},model:{value:e.editedItem.coordinates,callback:function(r){e.$set(e.editedItem,"coordinates",r)},expression:"editedItem.coordinates"}})],1)],1)],1)],1),t("v-card-actions",[t("v-spacer"),t("v-btn",{attrs:{color:"secondary"},on:{click:e.close}},[e._v(" Cancelar ")]),e.editedIndex===-1?t("v-btn",{attrs:{color:"primary"},on:{click:function(r){return e.save(e.editedItem)}}},[e._v(" Guardar ")]):t("v-btn",{attrs:{color:"primary",text:""},on:{click:function(r){return e.update(e.editedItem)}}},[e._v(" Actualizar ")])],1)],1)],1)],1)]},proxy:!0},{key:"item.establishments_id",fn:function({item:r}){return[t("span",[e._v(" "+e._s(e.getEstablishmentsById(r.establishments_id))+" ")])]}},{key:"item.headquarters_id",fn:function({item:r}){return[t("span",[e._v(" "+e._s(e.getHeadquartersById(r.headquarters_id))+" ")])]}},{key:"item.actions",fn:function({item:r}){return[t("v-icon",{staticClass:"mr-2",attrs:{small:""},on:{click:function(a){return e.editItem(r)}}},[e._v(" mdi-pencil ")]),t("v-icon",{attrs:{small:""},on:{click:function(a){return e.deleteItem(r)}}},[e._v(" mdi-delete ")])]}},{key:"no-data",fn:function(){return[t("v-btn",{attrs:{color:"primary"},on:{click:e.initialize}},[e._v(" Reset ")])]},proxy:!0}])})],1)],1),t("spinner-component",{attrs:{value:e.saving}})],1)},u=[],m=l(d,c,u,!1,null,null,null,null);const $=m.exports;export{$ as default};
