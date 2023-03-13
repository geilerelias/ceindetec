import{A as o}from"./AppLayout.83401602.js";import{B as a}from"./BreadCrumbs.14245490.js";import{n}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.c2e27410.js";import"./app.8bbe0a1c.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.da80baee.js";const l={name:"Permission",components:{AppLayout:o,BreadCrumbs:a},props:["data","errors"],data(){return{editMode:!1,isOpen:!1,search:"",form:{id:null,name:null},items:[{text:"Dashboard",disabled:!1,href:"/dashboard"},{text:"Permission",disabled:!0,href:"/Permission"}],dialog:!1,dialogDelete:!1,headers:[{text:"Id",align:"start",sortable:!1,value:"id"},{text:"Nombre",value:"name"},{text:"Acci\xF3n",value:"actions",sortable:!1}],desserts:[],editedIndex:-1,editedItem:{name:""},defaultItem:{name:""}}},computed:{formTitle(){return this.editedIndex===-1?"Nuevo permiso":"Editar permiso"}},watch:{dialog(s){s||this.close()}},methods:{closeModal:function(){this.isOpen=!1,this.reset(),this.editMode=!1},reset(){this.$nextTick(()=>{this.editedItem=Object.assign({},this.defaultItem),this.editedIndex=-1})},update(s){s._method="PUT",this.$inertia.post("/permission/"+s.id,s,{onSuccess:e=>{this.$swal({icon:`${e.props.errors.name?"error":"success"}`,title:`${e.props.errors.name?"Oops...":"Good job!"}`,text:`${e.props.errors.name?e.props.errors.name[0]:e.props.flash.message}`})},onError:e=>{this.$swal("Opps...!","Excuse me, an error occurred.","warning")}}),this.reset(),this.closeModal(),this.editMode=!1,this.close()},editItem(s){this.editedIndex=this.data.indexOf(s),this.editedItem=Object.assign({},s),this.dialog=!0},deleteItem(s){s._method="DELETE",this.$swal({title:"\xBFEst\xE1s seguro de que quieres eliminar este permiso?",text:"No podr\xE1s revertir esto.!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",cancelButtonText:"Cancelar",confirmButtonText:"\xA1Si, eliminarlo!"}).then(e=>{e.isConfirmed&&(this.$inertia.post("/permission/"+s.id,s,{onSuccess:t=>{this.$swal("Deleted!","Your item has been deleted.","success")},onError:t=>{this.$swal("Opps...!","Excuse me, an error occurred.","warning")}}),this.$nextTick(()=>{this.editedItem=Object.assign({},this.defaultItem),this.editedIndex=-1}))}),this.reset()},close(){this.dialog=!1,this.$nextTick(()=>{this.editedItem=Object.assign({},this.defaultItem),this.editedIndex=-1})},save(s){this.editedIndex===-1?this.$inertia.post("/permission",s,{onSuccess:e=>{this.$swal({icon:`${e.props.errors.name?"error":"success"}`,title:`${e.props.errors.name?"Oops...":"\xA1Buen trabajo!"}`,text:`${e.props.errors.name?e.props.errors.name[0]:e.props.flash.message}`})},onError:e=>{console.log(e),this.$swal({icon:"error",title:"Oops...",text:this.errors.errors.name[0]})}}):this.$inertia.post("/posts/"+s.id,s,{onSuccess:e=>{this.$swal({icon:`${e.props.errors.name?"error":"success"}`,title:`${e.props.errors.name?"Oops...":"\xA1Buen trabajo!"}`,text:`${e.props.errors.name?e.props.errors.name[0]:e.props.flash.message}`})},onError:e=>{console.log(e),this.$swal({icon:"error",title:"Oops...",text:this.errors.errors.name[0]})}}),this.reset(),this.closeModal(),this.editMode=!1,this.close()},initialize(){location.reload()}}};var d=function(){var e=this,t=e._self._c;return t("app-layout",[t("bread-crumbs",{attrs:{name:"Permisos",items:e.items}}),t("v-container",{staticClass:"d-flex justify-center"},[t("v-card",[t("v-data-table",{staticClass:"elevation-1",attrs:{headers:e.headers,items:e.data,"sort-by":"id",search:e.search},scopedSlots:e._u([{key:"top",fn:function(){return[t("v-toolbar",{attrs:{flat:""}},[t("v-text-field",{staticClass:"mr-3",attrs:{"append-icon":"mdi-magnify",label:"Buscar permiso","single-line":"","hide-details":""},model:{value:e.search,callback:function(r){e.search=r},expression:"search"}}),t("v-divider",{staticClass:"mx-4",attrs:{inset:"",vertical:""}}),t("v-spacer"),t("v-dialog",{attrs:{"max-width":"500px"},scopedSlots:e._u([{key:"activator",fn:function({on:r,attrs:i}){return[t("v-btn",e._g(e._b({staticClass:"mb-2",attrs:{color:"primary",dark:""}},"v-btn",i,!1),r),[e._v(" Nuevo permiso ")])]}}]),model:{value:e.dialog,callback:function(r){e.dialog=r},expression:"dialog"}},[t("v-card",[t("v-card-title",[t("span",{staticClass:"text-h5"},[e._v(e._s(e.formTitle))])]),t("v-card-text",[t("v-container",[t("v-row",[t("v-col",{attrs:{cols:"12"}},[t("v-text-field",{attrs:{label:"Nombre del permiso",placeholder:"Nombre de ejemplo"},on:{keyup:function(r){if(!r.type.indexOf("key")&&e._k(r.keyCode,"enter",13,r.key,"Enter"))return null;e.editedIndex===-1?e.save(e.editedItem):e.update(e.editedItem)}},model:{value:e.editedItem.name,callback:function(r){e.$set(e.editedItem,"name",r)},expression:"editedItem.name"}})],1)],1)],1)],1),t("v-card-actions",[t("v-spacer"),t("v-btn",{attrs:{color:"blue darken-1",text:""},on:{click:e.close}},[e._v(" Cancelar ")]),e.editedIndex===-1?t("v-btn",{attrs:{color:"blue darken-1",text:""},on:{click:function(r){return e.save(e.editedItem)}}},[e._v(" Guardar ")]):t("v-btn",{attrs:{color:"blue darken-1",text:""},on:{click:function(r){return e.update(e.editedItem)}}},[e._v(" Actualizar ")])],1)],1)],1)],1)]},proxy:!0},{key:"item.actions",fn:function({item:r}){return[t("v-icon",{staticClass:"mr-2",attrs:{small:""},on:{click:function(i){return e.editItem(r)}}},[e._v(" mdi-pencil ")]),t("v-icon",{attrs:{small:""},on:{click:function(i){return e.deleteItem(r)}}},[e._v(" mdi-delete ")])]}},{key:"no-data",fn:function(){return[t("v-btn",{attrs:{color:"primary"},on:{click:e.initialize}},[e._v(" Reset ")])]},proxy:!0}])})],1)],1)],1)},c=[],m=n(l,d,c,!1,null,null,null,null);const _=m.exports;export{_ as default};
