import{A as s}from"./AppLayout.9de32e63.js";import{V as r}from"./vue2-editor.esm.8da2e201.js";import{n as i}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.c6242de4.js";import"./app.2206ab69.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.af9b0a02.js";const a={name:"Index",components:{AppLayout:s,VueEditor:r},data:()=>({selectedItem:1,items:[{text:"Error en red",icon:"mdi-tag"},{text:"Inconveniente con el cargue de archivo",icon:"mdi-tag"},{text:"No puedo registrar estudiantes",icon:"mdi-tag"}]})};var n=function(){var t=this,e=t._self._c;return e("app-layout",[e("v-container",[e("v-row",[e("v-col",[e("v-card",[e("v-list",{attrs:{dense:""}},[e("v-subheader",[t._v(" Tickets Recientes")]),e("v-list-item-group",{attrs:{color:"primary"},model:{value:t.selectedItem,callback:function(o){t.selectedItem=o},expression:"selectedItem"}},t._l(t.items,function(o,l){return e("v-list-item",{key:l},[e("v-list-item-icon",[e("v-icon",{domProps:{textContent:t._s(o.icon)}})],1),e("v-list-item-content",[e("v-list-item-title",{domProps:{textContent:t._s(o.text)}})],1)],1)}),1)],1)],1)],1),e("v-col",{staticClass:"col-md-8"},[e("v-card",[e("v-card-title",[t._v(" Abrir Ticket ")]),e("v-divider"),e("v-card-text",[e("v-row",[e("v-col",{staticClass:"col-sm-12 col-md-6"},[e("v-text-field",{attrs:{label:"Nombre",value:t.$page.user.name,readonly:"",outlined:""}})],1),e("v-col",{staticClass:"col-sm-12 col-md-6"},[e("v-text-field",{attrs:{label:"Direcci\xF3n de email",value:t.$page.user.email,readonly:"",outlined:""}})],1),e("v-col",{staticClass:"col-sm-12 col-md-12"},[e("v-text-field",{attrs:{label:"Asunto",outlined:""}})],1),e("v-col",{staticClass:"col-sm-12 col-md-12"},[e("v-autocomplete",{attrs:{label:"Categor\xEDa",outlined:""},scopedSlots:t._u([{key:"append-outer",fn:function(){return[e("v-slide-x-reverse-transition",{attrs:{mode:"out-in"}},[e("div",[e("inertia-link",{attrs:{href:t.route("ticket-category.index")}},[e("v-btn",{attrs:{fab:"",small:"",color:"primary"}},[e("v-icon",{attrs:{color:"white"}},[t._v(" mdi-plus ")])],1)],1)],1)])]},proxy:!0}])})],1),e("v-col",{staticClass:"col-sm-12 col-md-12"},[e("vue-editor",{ref:"myTextEditor"})],1),e("v-col",[e("v-file-input",{attrs:{color:"primary",counter:"",label:"Adjuntar archivo",multiple:"",placeholder:"Select your files","prepend-icon":"mdi-paperclip",outlined:"","show-size":1e3},scopedSlots:t._u([{key:"selection",fn:function({index:o,text:l}){return[o<2?e("v-chip",{attrs:{color:"secondary",dark:"",label:"",small:""}},[t._v(" "+t._s(l)+" ")]):o===2?e("span",{staticClass:"text-overline grey--text text--darken-3 mx-2"},[t._v(" +"+t._s(t.files.length-2)+" File(s) ")]):t._e()]}}]),model:{value:t.files,callback:function(o){t.files=o},expression:"files"}})],1)],1)],1),e("v-card-actions",{staticClass:"d-flex justify-center align-center"},[e("v-btn",{staticClass:"primary"},[t._v("Enviar")]),e("v-btn",{staticClass:"secondary"},[t._v("Cancelar")])],1)],1)],1)],1)],1)],1)},c=[],d=i(a,n,c,!1,null,"3f277eb3",null,null);const C=d.exports;export{C as default};
