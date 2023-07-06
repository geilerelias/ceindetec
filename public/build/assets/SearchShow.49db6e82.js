import{S as i}from"./SimpleLayout.620b2c6f.js";import{S as o}from"./SpinnerComponent.6d0b39d4.js";import{Q as r}from"./qrcode.vue.esm.d2f69042.js";import{l}from"./Logo.5a18e3f9.js";import n from"./Edit.f483cf01.js";import{n as c}from"./_plugin-vue2_normalizer.358ffe07.js";import"./SettingsDropdown.da80baee.js";import"./logo-ceindetec.0997e866.js";import"./colombia.89799eca.js";import"./vue2-editor.esm.e0ba3048.js";import"./app.77aa44cf.js";const d={name:"SearchEdit",components:{SpinnerComponent:o,QrcodeVue:r,SimpleLayout:i,logo:l,simpleLayout:i,edit:n},data:()=>({loading:!1,snackbar:!1,snackbarColor:"default",otp:"",text:"",expectedOtp:"133707",qrCode:null,establishments:[],headquarters:[],dialog:!1,editItem:null}),created(){axios.get("/dashboard/establishment/all").then(a=>{console.log(a.data),this.establishments=a.data}),axios.get("/dashboard/headquarters/all").then(a=>{console.log(a.data),this.headquarters=a.data})},methods:{getEstablishment(a){try{return this.establishments.find(e=>e.id===a).name}catch{return null}},getHeadquarters(a){try{return this.headquarters.find(e=>e.id===a).name}catch{return null}},showEditDialog(a){this.editItem=a,this.dialog=!0},closeDialog(){this.dialog=!1,this.editItem=null},onFinish(a){this.loading=!0,this.qrCode=null,axios.get(`/qrcode/search/CONV005-${a}`).then(t=>{this.qrCode=t.data,this.loading=!1,this.snackbarColor="success",this.text=`B\xFAsqueda exitosa de consecutivo "CONV005-${a}" (${this.snackbarColor})`,this.snackbar=!0}).catch(t=>{console.log(t),this.loading=!1,this.snackbarColor="error",this.text=`B\xFAsqueda err\xF3nea de consecutivo "CONV005-${a}" (${this.snackbarColor})`,this.snackbar=!0})}}};var u=function(){var t=this,e=t._self._c;return e("simple-layout",{scopedSlots:t._u([{key:"header",fn:function(){return[e("p",{staticClass:"text-h5 white--text font-weight-bold text-uppercase text-center ma-12"},[t._v(" Buscar y Mostrar ")])]},proxy:!0}])},[e("v-main",[e("v-container",[e("h1",{staticClass:"text-h4 font-weight-bold mb-0 text-left"},[t._v("Buscar y mostrar ")]),e("div",{staticClass:"primary--text text-subtitle-1 font-weight-bold mb-4 text-left"},[t._v(" Ingresa el serial del c\xF3digo a Buscar ")]),e("p",{staticClass:"base-body text-body-1 grey--text text--darken-1 text-left mb-10"},[t._v(" A partir del consecutivo "),e("span",{staticClass:"font-weight-bold text--primary"},[t._v("CONV005-")]),t._v(" ingresa el serial correspondiente para consultar y modificar, si este se encuentra registrado; de ser as\xED, autom\xE1ticamente el sistema te mostrara la informaci\xF3n para posteriormente actualizar. ")]),e("div",[e("div",{staticClass:"ma-auto position-relative",staticStyle:{"max-width":"300px"}},[e("v-otp-input",{attrs:{disabled:t.loading},on:{finish:t.onFinish},model:{value:t.otp,callback:function(s){t.otp=s},expression:"otp"}}),e("v-overlay",{attrs:{absolute:"",value:t.loading}},[e("v-progress-circular",{attrs:{indeterminate:"",color:"primary"}})],1)],1),t.qrCode!==null?e("div",[e("v-row",{staticClass:"d-flex justify-center"},[e("v-col",{staticClass:"col-md-8 col-12"},[e("v-card",{staticClass:"h-full d-flex flex-column"},[e("v-card-title",{staticClass:"d-flex justify-space-around pt-1 pb-0 mb-0"},[e("logo",{attrs:{tile:!0,light:!1,color:"primary",width:80}}),e("logo",{attrs:{tile:!0,light:!1,color:"primary",width:80,src:"logoAlcaldia"}})],1),e("v-card-text",{staticClass:"pa-3 flex-grow-1"},[e("div",{staticClass:"d-flex align-center flex-column"},[e("v-avatar",{attrs:{tile:"",size:"150",color:""}},[e("qrcode-vue",{attrs:{value:`http://sigac.almaguajira.com/qrcode/${t.qrCode.consecutive}`,size:150,level:"H"}})],1),e("div",{staticClass:"text-center mt-2"},[e("div",{staticClass:"font-weight-bold text-body-2"},[t._v(" "+t._s(t.qrCode.consecutive)+" ")])]),e("div",{staticClass:"d-flex justify-space-around"},[e("div",[e("v-input",{attrs:{label:"Estado:"}})],1),t._v(" \xA0 "),t.qrCode.status=="inactive"?e("v-chip",{staticClass:"font-weight-bold accent",attrs:{small:""}},[t._v(" "+t._s(t.qrCode.status)+" ")]):e("v-chip",{staticClass:"font-weight-bold secondary",attrs:{small:""}},[t._v(" "+t._s(t.qrCode.status)+" ")])],1)],1),t.qrCode.status!=="inactive"?e("div",[e("div",[t._v(" Descripci\xF3n: "),e("div",{staticClass:"font-weight-black text--primary description",domProps:{innerHTML:t._s(t.qrCode.description)}})]),e("div",[t._v(" Establecimiento: "),e("span",{staticClass:"font-weight-black text--primary"},[t._v(" "+t._s(t.getEstablishment(t.qrCode.establishment_id))+" ")])]),e("div",[t._v(" Sede: "),e("span",{staticClass:"font-weight-black text--primary"},[t._v(" "+t._s(t.getHeadquarters(t.qrCode.headquarters_id))+" ")])])]):t._e()]),e("v-divider"),e("v-card-actions",{staticStyle:{height:"50px"}},[e("v-spacer"),e("v-btn",{staticClass:"mr-3",attrs:{text:"",fab:"",small:""},on:{click:function(s){return t.showEditDialog(t.qrCode)}}},[e("v-icon",[t._v("mdi-text-box-edit-outline")])],1)],1)],1)],1)],1)],1):t._e(),e("v-snackbar",{attrs:{color:t.snackbarColor,timeout:2e3},model:{value:t.snackbar,callback:function(s){t.snackbar=s},expression:"snackbar"}},[t._v(" "+t._s(t.text)+" ")])],1)]),e("div",[t._v(" "+t._s(t.$page.auth.roles[0]==="Admin")+" "),e("br"),t._v(" "+t._s(t.$page.auth.permissions[0]==="view dashboard")+" "),e("br"),t._v(" "+t._s(t.$page.auth.permissions)+" "+t._s(t.$page.auth.permissions.find(s=>s>"view dashboard"))+" "+t._s(t.$page.auth.permissions.find(s=>s>"Ver dashboard"))+" ")])],1),e("v-row",{attrs:{justify:"center"}},[e("v-dialog",{attrs:{fullscreen:"","hide-overlay":"",transition:"dialog-bottom-transition",persistent:""},model:{value:t.dialog,callback:function(s){t.dialog=s},expression:"dialog"}},[e("v-card",{staticClass:"rounded-0"},[e("v-toolbar",{attrs:{dark:"",color:"primary",height:"100"}},[e("v-toolbar-title",[e("div",{staticClass:"text-subtitle-2 text-sm-h6 white--text font-weight-bold text-uppercase py-0 my-0"},[t._v(" Actualizaci\xF3n de informaci\xF3n ")]),e("div",{staticClass:"text-caption text-sm-subtitle-1 secondary--text font-weight-bold py-0 my-0"},[t._v(" CONVENIO DE COOPERACI\xD3N No 005 2021 ")])]),e("v-spacer"),e("v-btn",{attrs:{icon:"",dark:""},on:{click:function(s){return t.closeDialog()}}},[e("v-icon",[t._v("mdi-close")])],1)],1),e("v-toolbar",{staticClass:"secondary",attrs:{dense:"","max-height":"10"}}),t.editItem!==null?e("edit",{attrs:{data:t.editItem}}):t._e()],1)],1)],1)],1)},v=[],h=c(d,u,v,!1,null,"2c522473",null,null);const k=h.exports;export{k as default};