import{A as o}from"./AppLayout.9de32e63.js";import{B as n}from"./BreadCrumbs.14245490.js";import{c as i}from"./colombia.89799eca.js";import{P as d}from"./PictureInput.1e25d6a4.js";import{S as c}from"./SpinnerComponent.6d0b39d4.js";import{n as m}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.c6242de4.js";import"./app.2206ab69.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.af9b0a02.js";const u={name:"Edit",components:{AppLayout:o,BreadCrumbs:n,PictureInput:d,SpinnerComponent:c},props:["data","errors"],data:()=>({items:[{text:"Dashboard",disabled:!1,href:"/dashboard"},{text:"Sedes",disabled:!1,href:"/dashboard/headquarters"},{text:"Actualizar",disabled:!0,href:"#"}],saving:!1,valid:!1,name:"",imageUrl:"",imageFile:null,imageName:"",departments:[],establishments:[],headquarters:{establishment_id:"",name:"",nit:"0000",dane_code:"0000",icfes_code:"0000",address:"",municipality:"",department:"La Guajira",email:"mail@example.com",phone:"3106947004"},defaultHeadquarters:{establishment_id:"",name:"",nit:"",dane_code:"",icfes_code:"",address:"",municipality:null,department:null,email:"",phone:""},rules:{required:a=>!!a||"Campo requerido.",max:a=>a.length<=20||"M\xE1ximo 20 caracteres",min:a=>a.length>=10||"M\xEDnimo 10 caracteres",email:a=>/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(a)||"Invalid e-mail.",phone:a=>/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/.test(a)||"Numero telef\xF3nico invalido.",text:a=>/^\s+$/.test(a)||"Solo caracteres alfab\xE9ticos.",number:a=>/^\d+$/.test(a)||"solo caracteres num\xE9ricos."}}),created(){for(const a in i)this.departments.push(i[a].departamento);this.departments=this.departments.sort(),axios.get("/dashboard/establishment/all").then(a=>{console.log(a.data),this.establishments=a.data}).catch(a=>{console.log(a)}),this.headquarters=this.data},methods:{validate(){this.$refs.form.validate()},reset(){this.$refs.form.reset()},resetValidation(){this.$refs.form.resetValidation()},update(){if(this.saving=!0,!this.validate()&&!this.valid)this.$swal.fire("Campos Obligatorio!","Ingresa los campos obligatorios!","error"),this.saving=!1;else{let e=new FormData;for(var a in this.headquarters)e.append(a,this.headquarters[a]);this.headquarters._method="PUT",this.$inertia.post(this.route("headquarters.update",this.headquarters.id),this.headquarters,{onSuccess:t=>{t.data,console.log(t),console.log("este es page",this.$page),this.$swal({icon:`${this.$page.errors.name?"error":"success"}`,title:`${this.$page.errors.name?"Ups...":"\xA1Buen trabajo!"}`,text:`${this.$page.errors.name?this.$page.errors.name[0]:this.$page.flash.message}`}).then(s=>{this.saving=!1,s.isConfirmed&&(this.headquarters=this.defaultHeadquarters,this.reset(),this.resetValidation(),this.$inertia.get(this.route("headquarters.index")))})},onError:t=>{console.log(t),this.saving=!1;const s=t.response.data.errors;let r="";for(var l in s)r+=l+": "+s[l]+`
 `;this.$swal.fire("Error!",r,"error"),console.log(r)},onFinish:t=>{this.saving=!1}})}},getCities(a){try{return i.filter(function(e){return e.departamento==a})[0].ciudades}catch{return[]}}}};var h=function(){var e=this,t=e._self._c;return t("div",[t("app-layout",[t("bread-crumbs",{attrs:{name:"Actualizaci\xF3n de sede",items:e.items}}),t("v-container",{staticClass:"d-flex justify-center"},[t("div",{staticClass:"py-6",staticStyle:{"max-width":"800px"}},[t("v-card",{staticClass:"mt-4 v-card"},[t("v-card-title",{staticClass:"align-start"},[t("v-card",{staticClass:"overflow-hidden mt-n9 transition-swing elevation-6 rounded primary",staticStyle:{"max-width":"100%"}},[t("div",{staticClass:"pa-8"},[t("v-icon",{attrs:{dark:"",size:"36"}},[e._v("mdi-school")])],1)]),t("div",{staticClass:"text-h5 pl-4"},[e._v(" Ingresa la informaci\xF3n del establecimiento ")])],1),t("v-form",{ref:"form",model:{value:e.valid,callback:function(s){e.valid=s},expression:"valid"}},[t("v-container",{staticClass:"py-0 px-4"},[t("v-row",[t("v-col",{staticClass:"col-12"},[t("v-select",{attrs:{items:e.establishments,"item-text":"name","item-value":"id",label:"Establecimiento al que pertenece",rules:[e.rules.required]},model:{value:e.headquarters.establishment_id,callback:function(s){e.$set(e.headquarters,"establishment_id",s)},expression:"headquarters.establishment_id"}})],1),t("v-col",{staticClass:"col-8"},[t("v-text-field",{attrs:{label:"Nombre de la sede",rules:[e.rules.required,e.rules.min]},model:{value:e.headquarters.name,callback:function(s){e.$set(e.headquarters,"name",s)},expression:"headquarters.name"}})],1),t("v-col",{staticClass:"col-md-4 col-12"},[t("v-text-field",{attrs:{label:"C\xF3digo DANE"},model:{value:e.headquarters.dane_code,callback:function(s){e.$set(e.headquarters,"dane_code",s)},expression:"headquarters.dane_code"}})],1),t("v-col",{staticClass:"col-md-6 col-12"},[t("v-text-field",{attrs:{label:"Direcci\xF3n",rules:[e.rules.required]},model:{value:e.headquarters.address,callback:function(s){e.$set(e.headquarters,"address",s)},expression:"headquarters.address"}})],1),t("v-col",{staticClass:"col-md-3 col-12"},[t("v-select",{attrs:{items:e.departments,rules:[e.rules.required],label:"Departamento *",required:""},model:{value:e.headquarters.department,callback:function(s){e.$set(e.headquarters,"department",s)},expression:"headquarters.department"}})],1),t("v-col",{staticClass:"col-md-3 col-12"},[t("v-select",{attrs:{disabled:e.headquarters.department==null,items:e.getCities(e.headquarters.department),rules:[e.rules.required],label:"Municipio *",required:""},model:{value:e.headquarters.municipality,callback:function(s){e.$set(e.headquarters,"municipality",s)},expression:"headquarters.municipality"}})],1),t("v-col",{staticClass:"col-md-4 col-12"},[t("v-text-field",{attrs:{label:"Email",rules:[e.rules.email]},model:{value:e.headquarters.email,callback:function(s){e.$set(e.headquarters,"email",s)},expression:"headquarters.email"}})],1),t("v-col",{staticClass:"col-md-4 col-12"},[t("v-text-field",{attrs:{label:"tel\xE9fono",rules:[e.rules.phone]},model:{value:e.headquarters.phone,callback:function(s){e.$set(e.headquarters,"phone",s)},expression:"headquarters.phone"}})],1),t("v-col",{staticClass:"text-right col-12 pb-6"},[t("v-btn",{attrs:{color:"secondary"},on:{click:function(s){return e.reset()}}},[e._v(" limpiar formulario ")]),t("v-btn",{attrs:{color:"primary",disabled:!e.valid,loading:e.saving},on:{click:e.update}},[e._v(" Actualizar Informaci\xF3n ")])],1)],1)],1)],1)],1)],1)]),t("spinner-component",{attrs:{value:e.saving,color:"primary",opacity:.9}})],1)],1)},p=[],v=m(u,h,p,!1,null,null,null,null);const A=v.exports;export{A as default};
