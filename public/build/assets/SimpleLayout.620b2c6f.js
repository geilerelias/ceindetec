import{l as r}from"./Logo.5a18e3f9.js";import{S as o}from"./SettingsDropdown.da80baee.js";import{n as s}from"./_plugin-vue2_normalizer.358ffe07.js";const l={name:"SimpleLayout",props:{title:{type:String},extension:{type:Boolean,default:!0},elements:{type:Boolean,default:!0},app:{default:null,required:!1}},components:{logo:r,SettingsDropdown:o},data(){return{scrollInvoked:null,fixed:!1}},methods:{back(){window.history.back()},onScroll(n){if(typeof window>"u")return;const t=window.pageYOffset||n.target.scrollTop||0;this.fixed=t>120}}};var a=function(){var t=this,e=t._self._c;return e("v-app",[e("inertia-head",[e("title",[t._v(t._s(t.title))])]),e("v-expand-transition",[e("v-card",{staticClass:"no-print",class:{"sticky-top":t.fixed},attrs:{outlined:"",tile:""}},[e("v-app-bar",{directives:[{name:"scroll",rawName:"v-scroll",value:t.onScroll,expression:"onScroll"}],attrs:{color:"primary",dark:"",height:"90"},scopedSlots:t._u([t.extension===!0?{key:"extension",fn:function(){return[t._t("extension")]},proxy:!0}:null],null,!0)},[t.elements?e("v-btn",{staticClass:"d-print-none",attrs:{icon:""},on:{click:function(d){return t.back()}}},[e("v-icon",{attrs:{color:"white"}},[t._v(" mdi-arrow-left ")])],1):t._e(),e("logo",{attrs:{light:!0,tile:!0,width:150,color:"primary"}}),e("v-spacer"),e("div",{staticClass:"d-flex justify-space-around align-center"},[e("div",{staticClass:"text-right mr-sm-2 fill-height d-flex justify-space-around align-center"},[t._t("header")],2),t.elements===!0?e("settings-dropdown",{staticClass:"d-print-none"}):t._e()],1)],1),e("v-toolbar",{staticClass:"secondary",attrs:{dense:"","max-height":"10"}})],1)],1),e("main",{staticClass:"fill-height"},[t._t("default")],2)],1)},i=[],c=s(l,a,i,!1,null,null,null,null);const f=c.exports;export{f as S};
