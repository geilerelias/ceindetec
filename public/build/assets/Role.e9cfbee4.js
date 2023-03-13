import{A as a}from"./AppLayout.9de32e63.js";import{B as n}from"./BreadCrumbs.14245490.js";import{n as l}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.c6242de4.js";import"./app.2206ab69.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.af9b0a02.js";const d={components:{AppLayout:a,BreadCrumbs:n},props:["data","errors"],data(){return{loadingNewItem:!1,loadingEditItem:!1,loadingDeleteItem:!1,selectedRole:[],selectedPermission:[],permission:[],editMode:!1,isOpen:!1,search:"",searchPermission:"",form:{id:null,name:null},items:[{text:"Dashboard",disabled:!1,href:"/dashboard"},{text:"Roles",disabled:!0,href:"/roles"}],dialog:!1,dialogDelete:!1,headers:[{text:"Id",align:"start",sortable:!1,value:"id"},{text:"Nombre",value:"name"},{text:"Acciones",value:"actions",sortable:!1}],loading:!1,headersPermission:[{text:"Id",align:"start",sortable:!1,value:"id"},{text:"Nombre",value:"name"}],desserts:[],editedIndex:-1,editedItem:{name:""},defaultItem:{name:""}}},created(){for(let t=0;t<this.data.length;t++)axios.get(`/role/${this.data[t].id}/permissions`).then(e=>{this.data[t].permission=e.data}).catch(e=>{this.$swal("Opps...!","Excuse me, an error occurred.","warning")});axios.get("permission/all").then(t=>{this.permission=t.data}).catch(t=>{this.$swal("Opps...!","Excuse me, an error occurred.","warning")})},computed:{formTitle(){return this.editedIndex===-1?"Nuevo rol":"Editar rol"}},watch:{selectedRole(t){if(t.length>0){this.selectedPermission=[];let e=t[0].permission;for(const s in e){let i=this.permission.find(r=>r.name===e[s].name);this.selectedPermission.push(i)}}},dialog(t){t||this.close()}},methods:{grantPermissions(){if(this.selectedRole.length>0)if(this.selectedPermission.length>0){let t=[];for(let s=0;s<this.selectedPermission.length;s++)t.push(this.selectedPermission[s].name);let e={role:this.selectedRole[0].id,permission:t};this.$inertia.post("/role/assign/permissions",e,{onStart:s=>{console.log("onStart",s),this.loading=!0},onSuccess:s=>{this.$swal({icon:`${s.props.errors.name?"error":"success"}`,title:`${s.props.errors.name?"Oops...":"Good job!"}`,text:`${s.props.errors.name?s.props.errors.name[0]:s.props.flash.message}`})},onError:s=>{this.$swal("Opps...!","Excuse me, an error occurred.","warning")},onFinish:s=>{this.loading=!1}})}else this.$swal("Opps...!","you must select a permission.","warning");else this.$swal("Opps...!","you must select a role.","warning")},closeModal:function(){this.isOpen=!1,this.reset(),this.editMode=!1},reset(){this.$nextTick(()=>{this.editedItem=Object.assign({},this.defaultItem),this.editedIndex=-1})},update(t){t._method="PUT",this.$inertia.post("/role/"+t.id,t,{onStart:e=>{this.loadingEditItem=!0},onSuccess:e=>{this.$swal({icon:`${e.props.errors.name?"error":"success"}`,title:`${e.props.errors.name?"Oops...":"Good job!"}`,text:`${e.props.errors.name?e.props.errors.name[0]:e.props.flash.message}`})},onError:e=>{this.$swal("Opps...!","Excuse me, an error occurred.","warning")},onFinish:e=>{this.loadingEditItem=!1}}),this.reset(),this.closeModal(),this.editMode=!1,this.close()},editItem(t){this.editedIndex=this.data.indexOf(t),console.log(this.editedIndex),this.editedItem=Object.assign({},t),this.dialog=!0},deleteItem(t){t._method="DELETE",this.$swal({title:"Are you sure you want to delete this item?",text:"You won't be able to revert this!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Yes, delete it!"}).then(e=>{e.isConfirmed&&(this.$inertia.post("/role/"+t.id,t,{onStart:s=>{this.loadingDeleteItem=!0},onSuccess:s=>{this.$swal("Deleted!","Your item has been deleted.","success")},onError:s=>{this.$swal("Opps...!","Excuse me, an error occurred.","warning")},onFinish:s=>{this.loadingDeleteItem=!1}}),this.$nextTick(()=>{this.editedItem=Object.assign({},this.defaultItem),this.editedIndex=-1}))}),this.reset()},close(){this.dialog=!1,this.$nextTick(()=>{this.editedItem=Object.assign({},this.defaultItem),this.editedIndex=-1})},save(t){this.editedIndex===-1?(console.log("save"),this.$inertia.post("/role",t,{onStart:e=>{this.loadingNewItem=!0},onSuccess:e=>{this.$swal({icon:`${e.props.errors.name?"error":"success"}`,title:`${e.props.errors.name?"Oops...":"\xA1Buen trabajo!"}`,text:`${e.props.errors.name?e.props.errors.name[0]:e.props.flash.message}`})},onError:e=>{console.log(e),this.$swal({icon:"error",title:"Oops...",text:this.errors.errors.name[0]})},onFinish:e=>{this.loadingNewItem=!1,this.reset(),this.closeModal(),this.editMode=!1,this.close()}})):(console.log("update"),this.$inertia.put("/posts/"+t.id,t,{onSuccess:e=>{console.log(e),this.$swal({icon:`${e.props.errors.name?"error":"success"}`,title:`${e.props.errors.name?"Oops...":"\xA1Buen trabajo!"}`,text:`${e.props.errors.name?e.props.errors.name[0]:e.props.flash.message}`})},onError:e=>{console.log(e),this.$swal({icon:"error",title:"Oops...",text:this.errors.errors.name[0]})},onFinish:e=>{this.reset(),this.closeModal(),this.editMode=!1,this.close()}}))},initialize(){location.reload()}}};var c=function(){var e=this,s=e._self._c;return s("app-layout",[s("bread-crumbs",{attrs:{name:"Roles",items:e.items}}),s("v-container",{staticClass:"d-flex justify-center"},[s("v-row",[s("v-col",[s("v-data-table",{staticClass:"elevation-1",attrs:{headers:e.headers,items:e.data,"sort-by":"id",search:e.search,"single-select":"","single-expand":"","show-select":"","show-expand":""},scopedSlots:e._u([{key:"top",fn:function(){return[s("v-toolbar",{attrs:{flat:""}},[s("v-text-field",{staticClass:"mr-3",attrs:{light:"","append-icon":"mdi-magnify",label:"Buscar",placeholder:"Texto a buscar","single-line":"","hide-details":""},model:{value:e.search,callback:function(i){e.search=i},expression:"search"}}),s("v-divider",{staticClass:"mx-4",attrs:{inset:"",vertical:""}}),s("v-spacer"),s("v-dialog",{attrs:{"max-width":"500px"},scopedSlots:e._u([{key:"activator",fn:function({on:i,attrs:r}){return[s("v-btn",e._g(e._b({staticClass:"mb-2",attrs:{color:"primary",dark:"",loading:e.loadingNewItem,disabled:e.loadingNewItem}},"v-btn",r,!1),i),[e._v(" Nuevo rol ")])]}}]),model:{value:e.dialog,callback:function(i){e.dialog=i},expression:"dialog"}},[s("v-card",[s("v-card-title",[s("span",{staticClass:"text-h5"},[e._v(e._s(e.formTitle))])]),s("v-card-text",[s("v-container",[s("v-row",[s("v-col",{attrs:{cols:"12"}},[s("v-text-field",{attrs:{label:"Name"},model:{value:e.editedItem.name,callback:function(i){e.$set(e.editedItem,"name",i)},expression:"editedItem.name"}})],1)],1)],1)],1),s("v-card-actions",[s("v-spacer"),s("v-btn",{attrs:{color:"blue darken-1",text:""},on:{click:e.close}},[e._v(" Cancel ")]),e.editedIndex===-1?s("v-btn",{attrs:{color:"blue darken-1",text:""},on:{click:function(i){return e.save(e.editedItem)}}},[e._v(" Save ")]):s("v-btn",{attrs:{color:"blue darken-1",text:""},on:{click:function(i){return e.update(e.editedItem)}}},[e._v(" update ")])],1)],1)],1)],1)]},proxy:!0},{key:"item.actions",fn:function({item:i}){return[s("v-icon",{staticClass:"mr-2",attrs:{small:"",loading:e.loadingEditItem,disabled:e.loadingEditItem},on:{click:function(r){return e.editItem(i)}}},[e._v(" mdi-pencil ")]),s("v-icon",{attrs:{small:"",loading:e.loadingDeleteItem,disabled:e.loadingDeleteItem},on:{click:function(r){return e.deleteItem(i)}}},[e._v(" mdi-delete ")])]}},{key:"expanded-item",fn:function({headers:i,item:r}){return[s("td",{attrs:{colspan:i.length}},[e._v(" permisos establecidos: "),e._l(r.permission,function(o){return s("v-chip",{key:o.id,staticClass:"ma-2 white--text",attrs:{color:"indigo",small:""}},[e._v(" "+e._s(o.name)+" ")])})],2)]}},{key:"no-data",fn:function(){return[s("v-btn",{attrs:{color:"primary"},on:{click:e.initialize}},[e._v(" Reset ")])]},proxy:!0}]),model:{value:e.selectedRole,callback:function(i){e.selectedRole=i},expression:"selectedRole"}})],1),s("v-divider",{attrs:{vertical:""}}),s("v-col",{attrs:{cols:"12",md:"6"}},[s("v-card",[s("v-toolbar",{attrs:{flat:""}},[s("v-toolbar-title",[e._v("Permisos")]),s("v-spacer"),e.selectedRole.length>0?s("span",[e._v(" Rol seleccionado "+e._s(e.selectedRole[0].name))]):s("span",[e._v(" Rol no seleccionado")])],1),s("v-banner",{attrs:{"single-line":""},scopedSlots:e._u([{key:"actions",fn:function(){return[s("v-btn",{attrs:{color:"primary",loading:e.loading,disabled:e.loading},on:{click:e.grantPermissions}},[e._v(" Otorgar permisos ")])]},proxy:!0}])},[e._v(" Elija los permisos para el rol seleccionado. ")]),s("v-card-text",{staticClass:"grey lighten-4"},[s("v-sheet",{staticClass:"mx-auto",attrs:{"max-width":"500"}},[s("div",[s("v-data-table",{staticClass:"elevation-1",attrs:{headers:e.headersPermission,items:e.permission,"sort-by":"id",search:e.searchPermission,"show-select":""},scopedSlots:e._u([{key:"top",fn:function(){return[s("v-toolbar",{attrs:{flat:""}},[s("v-text-field",{staticClass:"mx-auto",attrs:{"append-icon":"mdi-magnify",label:"Buscar permisos","single-line":"","hide-details":""},model:{value:e.searchPermission,callback:function(i){e.searchPermission=i},expression:"searchPermission"}})],1)]},proxy:!0}]),model:{value:e.selectedPermission,callback:function(i){e.selectedPermission=i},expression:"selectedPermission"}})],1)])],1)],1)],1)],1)],1)],1)},m=[],h=l(d,c,m,!1,null,null,null,null);const _=h.exports;export{_ as default};
