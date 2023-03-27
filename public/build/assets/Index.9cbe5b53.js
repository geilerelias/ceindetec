import{_ as o}from"./app.7acbb6e1.js";import{A as i}from"./AppLayout.d8256fea.js";import{B as n}from"./BreadCrumbs.14245490.js";/* empty css                                                         */import{n as l}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.b2b49248.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.da80baee.js";const c={components:{AppLayout:i,BreadCrumbs:n,CreateUpdate:()=>o(()=>import("./CreateEdit.d2ed2b55.js"),["assets/CreateEdit.d2ed2b55.js","assets/vue2-editor.esm.b661da6c.js","assets/app.7acbb6e1.js","assets/app.3815f79d.css","assets/SpinnerComponent.6d0b39d4.js","assets/_plugin-vue2_normalizer.358ffe07.js","assets/SpinnerComponent.f23de6b6.css","assets/PictureInput.1e25d6a4.js","assets/PictureInput.e336a72f.css","assets/colombia.89799eca.js","assets/CreateEdit.3881e8ea.css"])},props:["data","errors"],data(){return{modalShow:!1,saving:!1,establishments:[],studyPlans:[],editMode:!1,isOpen:!1,search:"",person:Object,headers:[{text:"ID",align:"start",sortable:!1,value:"id"},{text:"IMAGEN",value:"profile_photo_path"},{text:"NOMBRES",value:"name"},{text:"APELLIDOS",value:"surname"},{text:"TIPO DOC.",value:"identification_type"},{text:"NUM. DOC.",value:"identification_number"},{text:"CARGO",value:"person_type"},{text:"ACCIONES",value:"actions",sortable:!1}],items:[{text:"Dashboard",disabled:!1,href:"dashboard"},{text:"Miembros de la comunidad educativa",disabled:!0,href:"areas.index"}],form:null}},methods:{ConvertStringToHTML(a){return new DOMParser().parseFromString(a,"text/html").body.innerText},getActualYear(){return new Date(Date.parse(`${new Date().getFullYear().toString()}-01-01`)).toISOString().slice(0,7)},create:function(){this.editMode=!1,this.openModal()},edit:function(a){console.log(a),this.form=Object.assign({},a),console.log(this.form),this.editMode=!0,this.openModal()},openModal:function(){this.isOpen=!0},closeModal:function(){this.isOpen=!1,this.editMode=!1},deleteRow(a){a._method="DELETE",this.$swal({title:"\xBFEst\xE1 seguro de que desea eliminar este elemento?",text:"\xA1No podr\xE1s revertir esto!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"S\xED, Eliminarlo!"}).then(e=>{e.isConfirmed&&this.$inertia.post(this.route("person.destroy",a.id),a,{onStart:t=>{this.loadingDeleteItem=!0},onSuccess:t=>{console.log("estamos eliminando la info",t),this.$swal({icon:`${t.props.errors.message?"error":"success"}`,title:`${t.props.errors.message?"Ups...":"\xA1Buen trabajo!"}`,text:`${t.props.errors.message?t.props.errors.message:t.props.flash.message}`})},onError:t=>{this.$swal("\xA1Ay...!","Disculpe, ocurri\xF3 un error.","warning")},onFinish:t=>{this.loadingDeleteItem=!1}})})},initialize(){this.$inertia.get(this.route("person.index"))}}};var d=function(){var e=this,t=e._self._c;return t("app-layout",[t("bread-crumbs",{attrs:{name:"Gesti\xF3n de los Miembros de la Comunidad educativa",items:e.items}}),t("v-container",{staticClass:"py-12"},[t("v-row",{staticClass:"ma-0"},[t("v-col",[t("v-card",{staticStyle:{width:"100%"}},[t("v-card-text",{},[t("v-row",{staticClass:"no-gutters"},[t("div",{staticClass:"d-flex justify-space-between justify-md-start col-md-6 col-12"},[t("v-btn",{staticClass:"mr-3 success",on:{click:function(s){return e.create()}}},[t("v-icon",{staticClass:"notranslate mr-2"},[e._v(" mdi-plus ")]),e._v(" Agregar ")],1),t("v-btn",{staticClass:"button-shadow primary--text",attrs:{outlined:""}},[t("v-icon",{staticClass:"notranslate mr-2",attrs:{"aria-hidden":"true"}},[e._v(" mdi-filter-variant ")]),e._v(" Filtros ")],1)],1),t("v-spacer"),t("div",{staticClass:"mx-auto mt-4 mt-md-0",staticStyle:{"max-width":"250px"}},[t("v-text-field",{attrs:{"hide-details":"",dense:"",enclosed:"",outlined:"","append-icon":"mdi-magnify",placeholder:"Buscar"},model:{value:e.search,callback:function(s){e.search=s},expression:"search"}})],1)],1)],1)],1)],1)],1),t("v-row",{staticClass:"ma-0"},[t("v-col",[t("v-card",{staticStyle:{width:"100%"}},[t("v-data-table",{staticClass:"elevation-1",attrs:{headers:e.headers,items:e.data,"sort-by":"calories",search:e.search},scopedSlots:e._u([{key:"item.profile_photo_path",fn:function({item:s}){return[t("v-img",{staticClass:"elevation-4 rounded-circle",attrs:{height:"40",width:"40",cover:"","aspect-ratio":1/1,src:s.profile_photo_path!==null?`/storage/${s.profile_photo_path}`:`https://ui-avatars.com/api/?name=${s.name}.&color=7F9CF5&background=EBF4FF`,alt:s.name}})]}},{key:"item.actions",fn:function({item:s}){return[t("div",{staticClass:"d-flex"},[t("v-btn",{staticClass:"mr-2",attrs:{"x-small":"",icon:"",loading:e.editMode,disabled:e.editMode},on:{click:function(r){return e.edit(s)}}},[t("v-icon",{attrs:{small:""}},[e._v(" mdi-pencil-outline ")])],1),t("v-btn",{staticClass:"mr-2",attrs:{icon:"","x-small":""}},[t("v-icon",{attrs:{small:""},on:{click:function(r){return e.deleteRow(s)}}},[e._v(" mdi-delete-outline ")])],1),t("inertia-link",{attrs:{href:e.route("person.show",s.id)}},[t("v-btn",{attrs:{icon:"","x-small":""}},[t("v-icon",{attrs:{small:""}},[e._v(" mdi-eye-outline ")])],1)],1)],1)]}},{key:"no-data",fn:function(){return[t("v-btn",{attrs:{color:"primary"},on:{click:e.initialize}},[e._v(" Reset ")])]},proxy:!0}])})],1)],1)],1)],1),e.isOpen?t("create-update",{attrs:{close:e.closeModal,open:e.isOpen,edit:e.editMode,value:e.form}}):e._e()],1)},u=[],m=l(c,d,u,!1,null,null,null,null);const y=m.exports;export{y as default};
