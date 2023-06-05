import{S as o}from"./SpinnerComponent.6d0b39d4.js";import{Q as l}from"./qrcode.vue.esm.d2f69042.js";import{l as n}from"./Logo.5a18e3f9.js";import{c}from"./colombia.89799eca.js";import{S as d}from"./SimpleLayout.620b2c6f.js";import{V as u}from"./vue2-editor.esm.38499d69.js";import{n as m}from"./_plugin-vue2_normalizer.358ffe07.js";import"./logo-ceindetec.0997e866.js";import"./SettingsDropdown.da80baee.js";import"./app.1e841923.js";const h={name:"Edit",props:["data"],components:{SpinnerComponent:o,QrcodeVue:l,logo:n,simpleLayout:d,VueEditor:u},data:()=>({qrcode:{status:"",description:"",photo_path:"",establishment_id:"",headquarters_id:""},defaultQrcode:{status:"",description:"",photo_path:"",establishment_id:"",headquarters_id:""},establishments:[],headquarters:[],rules:{required:s=>!!s||"Campo requerido.",max:s=>s.length<=20||"M\xE1ximo 20 caracteres",min:s=>s.length>=10||"M\xEDnimo 10 caracteres",email:s=>/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(s)||"Direcci\xF3n de correo invalida.",phone:s=>/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/.test(s)||"Numero telef\xF3nico invalido.",text:(s,t)=>/[a-zA-Z ]{2,254}/.test(s)||`Entrada incorrecta para el campo ${t}.`,number:s=>/^\d+$/.test(s)||"Solo caracteres num\xE9ricos."},valid:!1,customToolbar:[[{font:[]}],[{header:[!1,1,2,3,4,5,6]}],[{size:["small",!1,"large","huge"]}],["bold","italic","underline","strike"],[{align:""},{align:"center"},{align:"right"},{align:"justify"}],[{header:1},{header:2}],["blockquote","code-block"],[{list:"ordered"},{list:"bullet"},{list:"check"}],[{script:"sub"},{script:"super"}],[{indent:"-1"},{indent:"+1"}],[{color:[]},{background:[]}],["link","formula"],[{direction:"rtl"}],["clean"]]}),created(){this.qrcode=this.data,axios.get("/dashboard/establishment/all").then(s=>{this.establishments=s.data}).catch(s=>{console.log(s)}),this.qrcode.establishment_id!==""&&this.getHeadquarters(this.qrcode.establishment_id)},methods:{getCities(s){try{return c.filter(function(t){return t.departamento==s})[0].ciudades}catch{return[]}},getHeadquarters(s){s!==""&&axios.get(`/dashboard/establishment/${s}/headquarters`).then(t=>{this.headquarters=t.data}).catch(t=>{console.log(t)})},validate(){this.$refs.form.validate()},reset:function(){this.qrcode=this.defaulQrcode,this.resetValidation()},resetValidation(){this.$refs.form.resetValidation()},update:function(s){this.validate(),console.log(s),s._method="PUT";let t=new FormData;for(const e in s)t.set(e,s[e]);t.set("status","active"),console.log(t),this.$inertia.post(this.route("qrcode.update",s.id),t,{onSuccess:e=>{e.data,console.log(e);let a="";if(Object.keys(this.$page.errors).length>0){console.log("errors => ",this.$page.errors);for(var r in this.$page.errors)a+=r+": "+this.$page.errors[r]+`
 `;this.$swal({icon:"error",title:"Ups...",text:a})}else this.$swal({icon:"success",title:"\xA1Buen trabajo!",text:this.$page.flash.message}).then(i=>{this.saving=!1,i.isConfirmed&&(this.headquarters=this.defaultHeadquarters,this.reset(),this.resetValidation())})}})}}};var p=function(){var t=this,e=t._self._c;return e("div",[e("v-container",[e("v-row",{staticClass:"d-flex justify-center"},[e("v-col",{staticClass:"col-md-8 col-12"},[e("v-card",{staticClass:"mt-4 text-center"},[e("v-card-title",{staticClass:"d-flex justify-space-around pt-1 pb-0 mt-2"},[e("logo",{attrs:{tile:!0,light:!1,color:"primary",width:100}}),e("logo",{attrs:{tile:!0,light:!1,color:"primary",width:100,src:"logoAlcaldia"}})],1),e("v-card-text",{staticClass:"text-center"},[e("h4",{staticClass:"text-h6 mt-3 text--primary font-weight-black"},[t._v(" "+t._s(t.data.consecutive)+" ")]),e("div",{staticClass:"pa-1 flex-grow-1"},[e("div",{staticClass:"d-flex align-center flex-column"},[e("div",{staticClass:"d-flex justify-space-around"},[e("div",[e("v-input",{attrs:{label:"Estado:"}})],1),t._v(" \xA0 "),t.data.status=="inactive"?e("v-chip",{staticClass:"font-weight-bold accent",attrs:{small:""}},[t._v(" "+t._s(t.data.status)+" ")]):e("v-chip",{staticClass:"font-weight-bold secondary",attrs:{small:""}},[t._v(" "+t._s(t.data.status)+" ")])],1)])]),e("v-divider"),e("v-form",{ref:"form",model:{value:t.valid,callback:function(a){t.valid=a},expression:"valid"}},[e("div",{staticClass:"wrapper"},[e("div",{staticClass:"pa-8"},[e("v-row",{staticClass:"mb-5"},[e("v-col",{staticClass:"col-12"},[e("vue-editor",{ref:"myTextEditor",attrs:{"editor-toolbar":t.customToolbar,rules:[t.rules.required,t.rules.text(t.qrcode.description,"Descripci\xF3n")]},model:{value:t.qrcode.description,callback:function(a){t.$set(t.qrcode,"description",a)},expression:"qrcode.description"}})],1),e("v-col",{staticClass:"col-12"},[e("v-autocomplete",{attrs:{items:t.establishments,"item-text":"name","item-value":"id",label:"Establecimiento al que pertenece",outlined:"",rules:[t.rules.required]},on:{change:function(a){return t.getHeadquarters(t.qrcode.establishment_id)}},model:{value:t.qrcode.establishment_id,callback:function(a){t.$set(t.qrcode,"establishment_id",a)},expression:"qrcode.establishment_id"}})],1),e("v-col",{staticClass:"col-12"},[e("v-autocomplete",{attrs:{disabled:t.qrcode.establishment_id==""||t.qrcode.establishment_id==null,items:t.headquarters,"item-text":"name","item-value":"id",label:"Sede a la que pertenece",outlined:"",rules:[t.rules.required]},model:{value:t.qrcode.headquarters_id,callback:function(a){t.$set(t.qrcode,"headquarters_id",a)},expression:"qrcode.headquarters_id"}})],1)],1)],1)])]),e("div",{staticClass:"d-flex justify-end px-8"},[e("v-btn",{staticClass:"primary",attrs:{"v-permission":"edit post",block:"",dark:""},on:{click:function(a){return t.update(t.qrcode)}}},[t._v(" Actualizar informaci\xF3n ")])],1)],1)],1)],1)],1)],1)],1)},f=[],v=m(h,p,f,!1,null,"a01d6368",null,null);const j=v.exports;export{j as default};
