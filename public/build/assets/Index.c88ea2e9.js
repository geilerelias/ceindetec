import{A as r}from"./AppLayout.d8256fea.js";import{B as a}from"./BreadCrumbs.14245490.js";import{n}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.b2b49248.js";import"./app.7acbb6e1.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.da80baee.js";const l={name:"Index",components:{AppLayout:r,BreadCrumbs:a},props:["data","errors"],data:()=>({items:[{text:"Dashboard",disabled:!1,href:"/"},{text:"Establecimientos",disabled:!0,href:""}],headerTooltips:{name:"Name tooltip",calories:"Calories tooltip",fat:"Fat tooltip"},loadingNewItem:!1,loadingEditItem:!1,loadingDeleteItem:!1,selectedEstablishment:[],selectedPermission:[],permission:[],editMode:!1,isOpen:!1,search:"",searchPermission:"",form:{id:null,name:null},dialog:!1,dialogDelete:!1,headers:[{text:"Id",align:"start",sortable:!1,value:"id"},{text:"Nombre",value:"name"},{text:"Municipio",value:"municipality"},{text:"Departamento",value:"department"},{text:"Actions",value:"actions",sortable:!1}],loading:!1,editedIndex:-1,editedItem:{name:""},defaultItem:{name:""}}),created(){},computed:{formTitle(){return this.editedIndex===-1?"New Item":"Edit Item"}},watch:{selectedEstablishment(s){if(s.length>0){this.selectedPermission=[];let e=s[0].permission;for(const t in e){let i=this.permission.find(o=>o.name===e[t].name);this.selectedPermission.push(i)}}},dialog(s){s||this.close()}},methods:{editItem(s){this.$inertia.get(this.route("establishment.edit",s.id))},showItem(s){this.$inertia.get(this.route("establishment.show",s.id))},deleteItem(s){s._method="DELETE",this.$swal({title:"\xBFEst\xE1 seguro de que desea eliminar este elemento?",text:"\xA1No podr\xE1s revertir esto!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"S\xED, Eliminarlo!"}).then(e=>{e.isConfirmed&&this.$inertia.post(this.route("establishment.destroy",s.id),s,{onStart:t=>{this.loadingDeleteItem=!0},onSuccess:t=>{this.$swal("\xA1Eliminado!","Tu elemento ha sido eliminado.","success")},onError:t=>{this.$swal("\xA1Ay...!","Disculpe, ocurri\xF3 un error.","warning")},onFinish:t=>{this.loadingDeleteItem=!1}})}),this.reset()},save(s){this.editedIndex===-1?(console.log("save"),this.$inertia.post("/Establishment",s,{onStart:e=>{this.loadingNewItem=!0},onSuccess:e=>{this.$swal({icon:`${e.props.errors.name?"error":"success"}`,title:`${e.props.errors.name?"Oops...":"\xA1Buen trabajo!"}`,text:`${e.props.errors.name?e.props.errors.name[0]:e.props.flash.message}`})},onError:e=>{console.log(e),this.$swal({icon:"error",title:"Oops...",text:this.errors.errors.name[0]})},onFinish:e=>{this.loadingNewItem=!1,this.reset(),this.closeModal(),this.editMode=!1,this.close()}})):(console.log("update"),this.$inertia.put("/posts/"+s.id,s,{onSuccess:e=>{console.log(e),this.$swal({icon:`${e.props.errors.name?"error":"success"}`,title:`${e.props.errors.name?"Oops...":"\xA1Buen trabajo!"}`,text:`${e.props.errors.name?e.props.errors.name[0]:e.props.flash.message}`})},onError:e=>{console.log(e),this.$swal({icon:"error",title:"Oops...",text:this.errors.errors.name[0]})},onFinish:e=>{this.reset(),this.closeModal(),this.editMode=!1,this.close()}}))},initialize(){location.reload()}}};var c=function(){var e=this,t=e._self._c;return t("app-layout",[t("bread-crumbs",{attrs:{name:"Establecimientos Educativos",items:e.items}}),t("v-container",[t("v-row",{staticClass:"ma-0"},[t("v-col",[t("v-card",{staticStyle:{width:"100%"}},[t("v-card-text",{},[t("v-row",{staticClass:"no-gutters"},[t("div",{staticClass:"d-flex justify-space-between justify-md-start col-md-6 col-12"},[t("inertia-link",{attrs:{href:e.route("establishment.create")}},[t("v-btn",{staticClass:"mr-3 success"},[t("v-icon",{staticClass:"notranslate mr-2"},[e._v(" mdi-plus ")]),e._v(" Add ")],1)],1),t("v-btn",{staticClass:"button-shadow primary--text",attrs:{outlined:""}},[t("v-icon",{staticClass:"notranslate mr-2",attrs:{"aria-hidden":"true"}},[e._v(" mdi-filter-variant ")]),e._v(" Filters ")],1)],1),t("v-spacer"),t("div",{staticClass:"mx-auto mt-4 mt-md-0",staticStyle:{"max-width":"250px"}},[t("v-text-field",{attrs:{"hide-details":"",dense:"",enclosed:"",outlined:"","append-icon":"mdi-magnify",placeholder:"search"},model:{value:e.search,callback:function(i){e.search=i},expression:"search"}})],1)],1)],1)],1)],1)],1),t("v-row",{staticClass:"ma-0"},[t("v-col",[t("v-card",{staticStyle:{width:"100%"}},[t("v-data-table",{staticClass:"elevation-1",attrs:{headers:e.headers,items:e.data,"sort-by":"calories",search:e.search},scopedSlots:e._u([{key:"item.actions",fn:function({item:i}){return[t("div",{staticClass:"d-flex"},[t("v-icon",{staticClass:"mr-2",attrs:{size:"24",color:"secondary"},on:{click:function(o){return e.showItem(i)}}},[e._v(" mdi-information-outline ")]),t("v-icon",{staticClass:"mr-2",attrs:{size:"24",color:"secondary"},on:{click:function(o){return e.editItem(i)}}},[e._v(" mdi-pencil-outline ")]),t("v-icon",{attrs:{size:"24",color:"secondary"},on:{click:function(o){return e.deleteItem(i)}}},[e._v(" mdi-delete-outline ")])],1)]}},{key:"no-data",fn:function(){return[t("v-btn",{attrs:{color:"primary"},on:{click:e.initialize}},[e._v(" Reset ")])]},proxy:!0}]),model:{value:e.selectedEstablishment,callback:function(i){e.selectedEstablishment=i},expression:"selectedEstablishment"}})],1)],1)],1)],1)],1)},d=[],m=n(l,c,d,!1,null,"115aeb72",null,null);const w=m.exports;export{w as default};
