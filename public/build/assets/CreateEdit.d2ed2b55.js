import{V as l}from"./vue2-editor.esm.b661da6c.js";import{S as c}from"./SpinnerComponent.6d0b39d4.js";import{P as d}from"./PictureInput.1e25d6a4.js";import{c as o}from"./colombia.89799eca.js";import{n as u}from"./_plugin-vue2_normalizer.358ffe07.js";import"./app.7acbb6e1.js";const p={name:"CreateUpdate",components:{VueEditor:l,SpinnerComponent:c,PictureInput:d},props:{value:Object,edit:Boolean,open:{type:Boolean,default:!1},close:Function,errors:Object,establishment_id:{type:Number,default:-1},headquarter_id:{type:Number,default:-1}},data:()=>({saving:!1,gruposEtnicos:["Comunidades ind\xEDgenas","Comunidades negras","Comunidades afrocolombianas","Comunidad Raizal"],tiposDocumentos:[{text:"Registro Civil (RC)",value:"RC"},{text:"Tarjeta de identidad (TI)",value:"TI"},{text:"C\xE9dula de Ciudadan\xEDa (CC)",value:"CC"},{text:"C\xE9dula Extranjera (CE)",value:"CE"},{text:"Permiso Especial de Permanencia (PEP)",value:"PEP"},{text:"N\xFAmero establecido por la Secretar\xEDa de Educaci\xF3n (NES)",value:"NES"}],typePeople:["Estudiante","Docente","Acudiente","Administrativo","Coordinador","Director","Rector"],valid:!1,menu1:null,person:{name:"",surname:"",gender:"",identification_type:"",identification_number:"",birthday_date:"",ethnic_group:"",email:"",phone:"",blood_type:"",person_type:"",department:"",municipality:"",direction:"",relationship:"",attended_by:"",establishment_id:"",headquarter_id:"",profile_photo_path:""},defaultPerson:{name:"",surname:"",gender:"",identification_type:"",identification_number:"",birthday_date:"",ethnic_group:"",email:"",phone:"",blood_type:"",person_type:"",department:"",municipality:"",direction:"",relationship:"",attended_by:"",establishment_id:"",headquarter_id:"",profile_photo_path:""},rules:{required:s=>!!s||"Campo requerido.",max:s=>s.length<=20||"M\xE1ximo 20 caracteres",min:s=>s.length>=10||"M\xEDnimo 10 caracteres",email:s=>/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(s)||"Direcci\xF3n de correo invalida.",phone:s=>/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/.test(s)||"Numero telef\xF3nico invalido.",text:(s,e)=>/[a-zA-Z ]{2,254}/.test(s)||`Entrada incorrecta para el campo ${e}.`,number:s=>/^\d+$/.test(s)||"Solo caracteres num\xE9ricos."},management:[{title:"Editar",icon:"mdi-playlist-edit",route:"person.create.student"},{title:"Eliminar",icon:"mdi-playlist-remove",route:"person.index.student"},{title:"Crear",icon:"mdi-playlist-plus",route:"person.create.student"},{title:"Salir",icon:"mdi-close",route:"person.create.student"}],customStrings:{upload:"<p> Su dispositivo no admite la carga de archivos. </p>",drag:"Arrastre una imagen o <br> haga clic aqu\xED para seleccionar",tap:"Toque aqu\xED para seleccionar una foto <br> de su galer\xEDa",change:"Cambiar",remove:"Eliminar",select:"Selecciona una foto",selected:"<p>Photo successfully selected!</p>",fileType:"Este tipo de archivo no es compatible.",fileSize:"The file size exceeds the limit",aspect:"Landscape/Portrait"},departments:[],municipality:[],establishments:[],headquarters:[],step:1,habeasData:!1,dialog:!1,blood_types:["A+","B+","O+","AB+","A-","B-","O-","AB-"],relations:["Madre","Padre","Hermano","Hermana","Tio","Tia","Esposa","Esposo"],people:null,isLoading:!1,search:null}),created(){for(const s in o)this.departments.push(o[s].departamento);this.departments=this.departments.sort(),axios.get("/dashboard/establishment/all").then(s=>{console.log(s.data),this.establishments=s.data}),this.edit===!0&&(this.person=this.value,this.getByPersonType()),this.establishment_id>-1&&(this.person.establishment_id=this.establishment_id,this.$nextTick(()=>{this.getAllHeadquarters(),this.person.headquarter_id=this.headquarter_id}))},watch:{search(s){this.people!==null&&this.people.length>0||this.getByPersonType()}},computed:{currentTitle(){switch(this.step){case 1:return"Informaci\xF3n Personal";case 2:return"Informaci\xF3n de contacto";default:return"Informaci\xF3n de localizaci\xF3n"}},isEdit(){return this.reset,this.edit===!0&&(this.person=this.value,this.getAllHeadquarters()),this.edit},breadcrumbs(){return[{text:"Dashboard",disabled:!1,href:"/dashboard"},{text:"Miembros de la Comunidad educativa",disabled:!1,href:"/dashboard/person"},{text:this.edit?"Editar":"Crear",disabled:!0,href:"#"}]}},methods:{getMinDate(){let s=new Date(Date.now());return s.setFullYear(s.getFullYear()-70),s.toISOString().slice(0,10)},getMaxDate(){let s=new Date(Date.now());return s.setFullYear(s.getFullYear()-4),s.toISOString().slice(0,10)},getAllHeadquarters(){let s=this.person.establishment_id;s!==null&&axios.get(`/dashboard/establishment/${s}/headquarters`).then(e=>{this.headquarters=e.data}).catch(e=>{console.log(e)})},onChange(s){s?this.person.profile_photo_path=this.$refs.pictureInput.file:console.log("FileReader API not supported: use the <form>, Luke!")},validate(){this.$refs.form.validate()},closeModal(){this.reset(),this.close()},reset:function(){this.person=this.defaultPerson,this.resetValidation()},resetValidation(){this.$refs.form.resetValidation()},save:function(s){if(this.saving=!0,!this.validate()&&!this.valid)this.$swal.fire("Campos Obligatorio!","Ingresa los campos obligatorios o verifica que el formato sea correcto","error"),this.saving=!1;else{let e=new FormData;for(const t in s)e.set(t,s[t]);this.$inertia.post("/dashboard/person/add",e,{onSuccess:t=>{t.data,console.log(t);let a="";if(Object.keys(this.$page.errors).length>0){console.log("errors => ",this.$page.errors);for(var i in this.$page.errors)a+=i+": "+this.$page.errors[i]+`
 `;this.$swal({icon:"error",title:"Ups...",text:a})}else this.$swal({icon:"success",title:"\xA1Buen trabajo!",text:this.$page.flash.message}).then(r=>{this.saving=!1,r.isConfirmed&&(this.headquarters=this.defaultHeadquarters,this.reset(),this.resetValidation())})},onError:t=>{this.saving=!1;const a=t.response.data.errors;let i="";for(var r in a)i+=r+": "+a[r]+`
 `;this.$swal.fire("Error!",i,"error"),console.log(i),this.reset(),this.resetValidation()},onFinish:t=>{this.saving=!1,this.reset(),this.resetValidation(),this.establishment_id>-1&&(this.person.establishment_id=this.establishment_id,this.$nextTick(()=>{this.getAllHeadquarters(),this.person.headquarter_id=this.headquarter_id}))}})}},update:function(s){s._method="PUT";let e=new FormData;for(const t in s)e.set(t,s[t]);this.$inertia.post(this.route("person.update",s.id),e,{onSuccess:t=>{t.data,console.log(t);let a="";if(Object.keys(this.$page.errors).length>0){console.log("errors => ",this.$page.errors);for(var i in this.$page.errors)a+=i+": "+this.$page.errors[i]+`
 `;this.$swal({icon:"error",title:"Ups...",text:a})}else this.$swal({icon:"success",title:"\xA1Buen trabajo!",text:this.$page.flash.message}).then(r=>{this.saving=!1,r.isConfirmed&&(this.headquarters=this.defaultHeadquarters,this.reset(),this.resetValidation(),this.$inertia.get(this.route("person.index")))})},onError:t=>{this.reset(),this.closeModal()},onFinish:t=>{this.reset(),this.closeModal(),this.editMode=!1}})},getImg(){return this.edit?this.value.profile_photo_path!==null?`/storage/${this.value.profile_photo_path}`:`/src/avatar/null/null/${this.value.gender}.jpg`:""},getCities(s){try{return o.filter(function(e){return e.departamento==s})[0].ciudades}catch{return[]}},setHabeasData(s){this.habeasData=s,this.dialog=!1},showMoreOptions(s){},getByPersonType(){let s="Acudiente";this.isLoading=!0,axios.get(`/dashboard/person/${this.person.headquarter_id}/${s}/all`).then(e=>{console.log("resultado",e),this.people=e.data}).catch(e=>{console.log(e)}).finally(()=>this.isLoading=!1)}}};var m=function(){var e=this,t=e._self._c;return t("div",[t("v-dialog",{staticStyle:{"z-index":"9"},attrs:{value:e.open,fullscreen:"","hide-overlay":"",persistent:"",transition:"dialog-bottom-transition"}},[t("v-card",{attrs:{color:"grey lighten-4","max-width":"800",tile:""}},[t("v-toolbar",{staticStyle:{"max-height":"150px"},attrs:{color:"primary",dark:"",flat:""}},[t("v-btn",{attrs:{dark:"",icon:""},on:{click:function(a){return e.closeModal()}}},[t("v-icon",[e._v("mdi-close")])],1),t("v-toolbar-title",{staticClass:"text-h5 white--text"},[e._v(e._s(e.isEdit!==!1?"Editar miembro":"Crear nuevo miembro")+" ")]),t("v-spacer"),t("v-menu",{attrs:{bottom:"","offset-y":"",right:""},scopedSlots:e._u([{key:"activator",fn:function({on:a,attrs:i}){return[t("v-btn",e._g(e._b({attrs:{dark:"",icon:""}},"v-btn",i,!1),a),[t("v-icon",[e._v("mdi-dots-vertical")])],1)]}}])},[t("v-list",{attrs:{dense:""}},e._l(e.management,function(a,i){return t("inertia-link",{key:i,attrs:{href:e.route(a.route)}},[t("v-list-item",{attrs:{link:""}},[t("v-list-item-icon",[t("v-icon",[e._v(e._s(a.icon))])],1),t("v-list-item-title",[e._v(e._s(a.title))])],1)],1)}),1)],1)],1),t("v-container",[t("v-form",{ref:"form",model:{value:e.valid,callback:function(a){e.valid=a},expression:"valid"}},[t("v-card",{staticClass:"mt-12"},[t("v-card-title",{staticClass:"align-start"},[t("v-card",{staticClass:"overflow-hidden mt-n9 transition-swing elevation-6 rounded primary fixed",staticStyle:{"max-width":"100%"}},[t("div",{staticClass:"pa-8"},[t("v-icon",{attrs:{dark:"",size:"36"}},[e._v("mdi-account-supervisor")])],1)]),t("v-breadcrumbs",{attrs:{items:e.breadcrumbs}})],1),t("v-card-text",[t("div",{staticClass:"wrapper"},[t("div",{staticClass:"px-8"},[t("section",{attrs:{id:"info-personal"}},[t("v-row",{staticClass:"text-left"},[t("v-col",{staticClass:"col-10"},[t("h5",{staticClass:"text-h5 text-typo font-weight-normal mb-2"},[e._v(" Informaci\xF3n Personal ")]),t("p",{staticClass:"text-body font-weight-light"},[e._v(" Comencemos con la informaci\xF3n b\xE1sica. ")])])],1),t("v-row",{staticClass:"mb-5"},[t("v-col",{staticClass:"col-12 col-sm-6 col-md-8"},[t("v-row",[t("v-col",{attrs:{cols:"12",md:"6"}},[t("v-text-field",{attrs:{rules:[e.rules.required,e.rules.text(e.person.name,"nombre")],label:"Nombres",outlined:""},model:{value:e.person.name,callback:function(a){e.$set(e.person,"name",a)},expression:"person.name"}})],1),t("v-col",{attrs:{cols:"12",md:"6"}},[t("v-text-field",{attrs:{rules:[e.rules.required,e.rules.text(e.person.surname,"Apellido")],label:"Apellidos",outlined:""},model:{value:e.person.surname,callback:function(a){e.$set(e.person,"surname",a)},expression:"person.surname"}})],1),t("v-col",{staticClass:"col-12 col-sm-4"},[t("v-autocomplete",{attrs:{items:["Femenino","Masculino","Prefiero no decirlo"],rules:[e.rules.required],label:"G\xE9nero",outlined:""},model:{value:e.person.gender,callback:function(a){e.$set(e.person,"gender",a)},expression:"person.gender"}})],1),t("v-col",{staticClass:"col-12 col-sm-4"},[t("v-autocomplete",{attrs:{items:e.tiposDocumentos,rules:[e.rules.required],"item-text":"text","item-value":"value",label:"Tipo de identificaci\xF3n",outlined:""},model:{value:e.person.identification_type,callback:function(a){e.$set(e.person,"identification_type",a)},expression:"person.identification_type"}})],1),t("v-col",{staticClass:"col-12 col-sm-4"},[t("v-text-field",{attrs:{rules:[e.rules.required,e.rules.number],label:"Numero de identificaci\xF3n",outlined:""},model:{value:e.person.identification_number,callback:function(a){e.$set(e.person,"identification_number",a)},expression:"person.identification_number"}})],1),t("v-col",{staticClass:"col-12 col-sm-2"},[t("v-autocomplete",{attrs:{label:"Tipo de sangre",items:e.blood_types,outlined:""},model:{value:e.person.blood_type,callback:function(a){e.$set(e.person,"blood_type",a)},expression:"person.blood_type"}})],1),t("v-col",{staticClass:"col-12 col-sm-4"},[t("v-menu",{attrs:{"close-on-content-click":!1,"nudge-right":40,"min-width":"auto","offset-y":"",transition:"scale-transition"},scopedSlots:e._u([{key:"activator",fn:function({on:a,attrs:i}){return[t("v-text-field",e._g(e._b({attrs:{rules:[e.rules.required],label:"Fecha de nacimiento",outlined:"",readonly:""},model:{value:e.person.birthday_date,callback:function(r){e.$set(e.person,"birthday_date",r)},expression:"person.birthday_date"}},"v-text-field",i,!1),a))]}}]),model:{value:e.menu1,callback:function(a){e.menu1=a},expression:"menu1"}},[t("v-date-picker",{attrs:{max:e.getMaxDate(),min:e.getMinDate()},on:{input:function(a){e.menu1=!1}},model:{value:e.person.birthday_date,callback:function(a){e.$set(e.person,"birthday_date",a)},expression:"person.birthday_date"}})],1),e.$page.errors.starts_at?t("div",{staticClass:"text-red-500"},[e._v(e._s(e.$page.errors.starts_at[0])+" ")]):e._e()],1),t("v-col",{staticClass:"col-12 col-sm-6"},[t("v-autocomplete",{attrs:{items:e.gruposEtnicos,rules:[e.rules.required],label:"Grupo \xC9tnico al que pertenece",outlined:""},model:{value:e.person.ethnic_group,callback:function(a){e.$set(e.person,"ethnic_group",a)},expression:"person.ethnic_group"}})],1)],1)],1),t("v-col",{staticClass:"col-12 col-sm-6 col-md-4",staticStyle:{"max-height":"300px"}},[t("picture-input",{ref:"pictureInput",attrs:{crop:!0,customStrings:e.customStrings,prefill:e.getImg(),removable:!0,zIndex:0,"button-class":"v-btn--is-elevated v-btn--has-bg theme--light v-size--default success v-btn v-btn--is-elevated v-btn--has-bg theme--light v-size--small",height:"260",radius:"0",removeButtonClass:"v-btn--is-elevated v-btn--has-bg theme--light v-size--default error v-btn v-btn--is-elevated v-btn--has-bg theme--light v-size--small",size:"10",width:"260"},on:{change:e.onChange}})],1)],1)],1),t("section",{attrs:{id:"info-localization"}},[t("v-row",{staticClass:"text-left"},[t("v-col",{staticClass:"col-10"},[t("h5",{staticClass:"text-h5 text-typo font-weight-normal mb-2"},[e._v(" Informaci\xF3n de localizaci\xF3n ")]),t("p",{staticClass:"text-body font-weight-light"},[e._v(" En este apartado me contaras mas sobre la zona en la que vives ")])])],1),t("v-row",{staticClass:"mb-5"},[t("v-col",{staticClass:"col-12 col-sm-3"},[t("v-autocomplete",{attrs:{items:e.departments,rules:[e.rules.required],label:"Departamento *",outlined:"",required:""},model:{value:e.person.department,callback:function(a){e.$set(e.person,"department",a)},expression:"person.department"}})],1),t("v-col",{staticClass:"col-12 col-sm-3"},[t("v-autocomplete",{attrs:{disabled:e.person.department===null||e.person.department==="",items:e.getCities(e.person.department),rules:[e.rules.required],label:"Municipio *",outlined:"",required:""},model:{value:e.person.municipality,callback:function(a){e.$set(e.person,"municipality",a)},expression:"person.municipality"}})],1),t("v-col",{staticClass:"col-12 col-sm-6"},[t("v-text-field",{attrs:{rules:[e.rules.required],label:"Direcci\xF3n de residencia",outlined:""},model:{value:e.person.direction,callback:function(a){e.$set(e.person,"direction",a)},expression:"person.direction"}})],1),t("v-col",{staticClass:"col-12 col-sm-6"},[t("v-autocomplete",{attrs:{readonly:e.establishment_id>-1,items:e.establishments,"item-text":"name","item-value":"id",label:"Establecimiento al que pertenece",rules:[e.rules.required],outlined:""},on:{change:e.getAllHeadquarters},model:{value:e.person.establishment_id,callback:function(a){e.$set(e.person,"establishment_id",a)},expression:"person.establishment_id"}})],1),t("v-col",{staticClass:"col-12 col-sm-6"},[t("v-autocomplete",{attrs:{readonly:e.headquarter_id>-1,disabled:e.person.establishment_id===null||e.person.establishment_id==="",items:e.headquarters,"item-text":"name","item-value":"id",label:"Sede a la que pertenece",rules:[e.rules.required],outlined:""},model:{value:e.person.headquarter_id,callback:function(a){e.$set(e.person,"headquarter_id",a)},expression:"person.headquarter_id"}})],1)],1)],1),t("section",{attrs:{id:"info-contacto"}},[t("v-row",{staticClass:"text-left"},[t("v-col",{staticClass:"col-10"},[t("h5",{staticClass:"text-h5 text-typo font-weight-normal mb-2"},[e._v(" Informaci\xF3n de contacto ")]),t("p",{staticClass:"text-body font-weight-light"},[e._v(" Esta es la informaci\xF3n con cual nos pondremos en contacto contigo ")])])],1),t("v-row",{staticClass:"mb-5"},[t("v-col",{attrs:{cols:"12",sm:"6",md:"4"}},[t("v-text-field",{attrs:{rules:[e.rules.required,e.rules.email],label:"Correo electr\xF3nico",outlined:""},model:{value:e.person.email,callback:function(a){e.$set(e.person,"email",a)},expression:"person.email"}})],1),t("v-col",{attrs:{cols:"12",sm:"6",md:"4"}},[t("v-text-field",{attrs:{rules:[e.rules.required,e.rules.number],label:"Numero telef\xF3nico",outlined:""},model:{value:e.person.phone,callback:function(a){e.$set(e.person,"phone",a)},expression:"person.phone"}})],1),t("v-col",{attrs:{cols:"12",sm:"6",md:"4"}},[t("v-autocomplete",{attrs:{disabled:e.person.headquarter_id==="",items:e.typePeople,rules:[e.rules.required],label:"Rol en la comunidad educativa",outlined:""},on:{change:function(a){return e.getByPersonType()}},model:{value:e.person.person_type,callback:function(a){e.$set(e.person,"person_type",a)},expression:"person.person_type"}})],1)],1),t("v-expand-transition",[e.person.person_type==="Estudiante"?t("div",[t("v-row",{staticClass:"text-left"},[t("v-col",{staticClass:"col-10"},[t("h5",{staticClass:"text-h5 text-typo font-weight-normal mb-2"},[e._v(" Informaci\xF3n de acudiente. ")]),t("p",{staticClass:"text-body font-weight-light"},[e._v(" Esta es la informaci\xF3n con cual determinaremos las personas responsables de todo lo concerniente a los asuntos acad\xE9mico del estuante. ")])])],1),t("v-row",{staticClass:"mb-5"},[t("v-col",{attrs:{cols:"12",sm:"6",md:"4"}},[t("v-autocomplete",{attrs:{items:e.people,loading:e.isLoading,"search-input":e.search,"item-value":"id","item-text":"name",rules:[e.rules.required],label:"Acudido por",outlined:""},on:{"update:searchInput":function(a){e.search=a},"update:search-input":function(a){e.search=a}},scopedSlots:e._u([{key:"no-data",fn:function(){return[t("v-list-item",[t("v-list-item-title",[e._v(" Buscar el respectivo "),t("strong",[e._v(" Acudiente")])])],1)]},proxy:!0},{key:"selection",fn:function({attr:a,on:i,item:r,selected:n}){return[t("v-chip",e._g(e._b({staticClass:"white--text",attrs:{"input-value":n,color:"blue-grey"}},"v-chip",a,!1),i),[t("v-icon",{attrs:{left:""}},[e._v(" mdi-account-circle ")]),t("span",{domProps:{textContent:e._s(r.name)}})],1)]}},{key:"item",fn:function({item:a}){return[t("v-list-item-avatar",{staticClass:"font-weight-light white--text",attrs:{color:"indigo"}},[e._v(" "+e._s(a.name.charAt(0))+" "+e._s(a.surname.charAt(0))+" ")]),t("v-list-item-content",[t("v-list-item-title",[e._v(" "+e._s(a.name)+" \xA0"+e._s(a.surname)+" ")]),t("v-list-item-subtitle",{domProps:{textContent:e._s(a.identification_number)}})],1),t("v-list-item-action",[t("v-icon",[e._v("mdi-account-circle")])],1)]}}],null,!1,1698808646),model:{value:e.person.attended_by,callback:function(a){e.$set(e.person,"attended_by",a)},expression:"person.attended_by"}})],1),t("v-col",{attrs:{cols:"12",sm:"6",md:"4"}},[t("v-autocomplete",{attrs:{items:e.relations,rules:[e.rules.required],label:"Parentesco con el estudiante",outlined:""},model:{value:e.person.relationship,callback:function(a){e.$set(e.person,"relationship",a)},expression:"person.relationship"}})],1)],1)],1):e._e()])],1),t("v-row",[t("v-col",{staticClass:"d-flex justify-center align-center"},[t("v-switch",{model:{value:e.habeasData,callback:function(a){e.habeasData=a},expression:"habeasData"}}),t("a",{on:{click:function(a){a.stopPropagation(),e.dialog=!0}}},[e._v(" Acepto el tratamiento de la informaci\xF3n personal. ")])],1)],1)],1)]),t("div",{staticClass:"d-flex justify-end"},[e.edit?e._e():t("v-btn",{staticClass:"primary mx-1",attrs:{disabled:!e.valid||!e.habeasData},on:{click:function(a){return e.save(e.person)}}},[e._v(" Guardar ")]),e.edit?t("v-btn",{staticClass:"primary x-1",attrs:{dark:""},on:{click:function(a){return e.update(e.person)}}},[e._v(" Actualizar ")]):e._e(),t("v-btn",{staticClass:"secondary mx-1",attrs:{dark:"",type:"button"},on:{click:function(a){return e.closeModal()}}},[e._v(" Cancelar ")])],1)])],1)],1)],1)],1)],1),t("v-dialog",{attrs:{"max-width":"8.5in"},model:{value:e.dialog,callback:function(a){e.dialog=a},expression:"dialog"}},[t("v-card",[t("v-card-title",[e._v(" Autorizaci\xF3n para el tratamiento y uso de datos personales. ")]),t("v-card-text",{staticClass:"text-justify"},[e._v(" De conformidad con lo previsto en la Ley 1581 de 2012 \u201Cpor la cual se dictan las disposiciones generales para la protecci\xF3n de datos personales\u201D y el Decreto 1377 de 2013, que la reglamentan parcialmente, manifiesto que otorgo mi autorizaci\xF3n expresa y clara para que el "),t("span",{staticClass:"font-weight-bold"},[e._v(" CENTRO DE GESTI\xD3N TECNOL\xD3GICA DE LOS LLANOS (Ceindetec Llanos), ")]),e._v(" pueda hacer tratamiento y uso de mis datos personales, los cuales estar\xE1n reportados en la base de datos de la que es responsable dicha organizaci\xF3n y que han sido recolectados en las relaciones contractuales que \xE9sta realiza en desarrollo de su objeto social. De acuerdo a la normatividad citada, Ceindetec Llanos queda autorizado de manera expresa e inequ\xEDvoca para mantener y manejar la informaci\xF3n suministrada, solo para aquellas finalidades para las que se encuentra facultado y respetando en todo caso, la normatividad vigente sobre protecci\xF3n de datos personales. No obstante la presente autorizaci\xF3n, me reservo el derecho a ejercer en cualquier momento la posibilidad de conocer, actualizar, rectificar y solicitar la supresi\xF3n de mis datos personales en la base de datos de la organizaci\xF3n, cuando as\xED lo estime conveniente. ")]),t("v-card-actions",[t("v-spacer"),t("v-btn",{attrs:{color:"green darken-1",text:""},on:{click:function(a){return e.setHabeasData(!1)}}},[e._v(" Discrepar ")]),t("v-btn",{attrs:{color:"green darken-1",text:""},on:{click:function(a){return e.setHabeasData(!0)}}},[e._v(" Aceptar ")])],1)],1)],1),t("spinner-component",{attrs:{value:e.saving}})],1)},h=[],v=u(p,m,h,!1,null,null,null,null);const C=v.exports;export{C as default};
