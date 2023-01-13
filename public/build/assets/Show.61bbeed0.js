import{A as l}from"./AppLayout.0f21bcf8.js";import{B as i}from"./BreadCrumbs.14245490.js";import{n as d}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.8980123f.js";import"./app.8c123d0c.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.af9b0a02.js";const c={name:"Show",components:{AppLayout:l,BreadCrumbs:i},props:["data","errors"],data:()=>({items:[{text:"Dashboard",disabled:!1,href:"dashboard"},{text:"Miembros de la comunidad educativa",disabled:!1,href:"/dashboard/person"},{text:"Visualizaci\xF3n",disabled:!0,href:"#"}],selectedItem:1,list:[{text:"Real-Time",icon:"mdi-clock"},{text:"Audience",icon:"mdi-account"},{text:"Conversions",icon:"mdi-flag"}],switch1:!0,attended:null,headquarters:null,establishment:null}),created(){axios.get(`/dashboard/headquarters/${this.data.headquarter_id}/get-by-id`).then(s=>{console.log(s),this.headquarters=s.data}).catch(s=>{console.log(s)}),axios.get(`/dashboard/establishment/${this.data.establishment_id}/get-by-id`).then(s=>{console.log(s),this.establishment=s.data}).catch(s=>{console.log(s)}),this.data.attended_by!==null&&axios.get(`/dashboard/person/get/${this.data.attended_by}`).then(s=>{this.attended=s.data}).catch(s=>{console.log(s)})},methods:{getYearsOld(s){var t=new Date,a=new Date(s);console.log(s,a);var e=t.getFullYear()-a.getFullYear(),o=t.getMonth()-a.getMonth();return(o<0||o===0&&t.getDate()<a.getDate())&&e--,e},getDate(s){try{return new Date(s+" 00:00:00").toLocaleDateString("es-ES",{day:"numeric",month:"long",year:"numeric"})}catch{}},showNumericFormat(s){return Intl.NumberFormat("es-ES").format(s)}}};var r=function(){var t=this,a=t._self._c;return a("app-layout",[a("bread-crumbs",{attrs:{name:"Gesti\xF3n de los Miembros de la Comunidad educativa",items:t.items}}),a("v-container",[a("v-row",[a("v-col",{staticClass:"col-lg-9 mx-auto"},[a("v-card",{staticClass:"px-4 py-4 rounded-lg mx-auto"},[a("v-row",{staticClass:"mx-auto"},[a("v-col",{staticClass:"d-flex"},[a("div",{staticClass:"mr-6"},[a("v-avatar",{staticClass:"shadow rounded-circle",attrs:{size:"75"}},[a("v-img",{staticClass:"elevation-4 rounded-circle",attrs:{cover:"",src:t.data.profile_photo_path!==null?`/storage/${t.data.profile_photo_path}`:`https://ui-avatars.com/api/?name=${t.data.name}.&color=7F9CF5&background=EBF4FF`,alt:t.$page.user.name}})],1)],1),a("div",[a("h5",{staticClass:"mb-1 text-h5 text-typo font-weight-bold"},[t._v(" "+t._s(t.data.name)+" "+t._s(t.data.surname)+" ")]),a("p",{staticClass:"mb-0 font-weight-light text-body text-sm"},[t._v(" "+t._s(t.data.ethnic_group)+" ")]),a("p",{staticClass:"mb-0 font-weight-light text-body text-sm"},[t._v(" "+t._s(t.data.person_type)+" ")])])]),a("v-spacer"),a("div",{staticClass:"my-sm-auto mx-auto mt-3"},[a("div",{staticClass:"d-flex align-center"},[a("p",{staticClass:"mb-0 text-body text-xs ms-auto"},[t._v(" activar usuario ")]),a("v-switch",{staticClass:"ml-1",attrs:{color:"primary"},model:{value:t.switch1,callback:function(e){t.switch1=e},expression:"switch1"}})],1)])],1)],1),a("v-card",{staticClass:"card-shadow rounded-lg mt-6"},[a("div",{staticClass:"px-6 py-6"},[a("h5",{staticClass:"text-h5 font-weight-bold text-typo"},[t._v(" Informaci\xF3n personal ")])]),a("div",{staticClass:"px-6 pb-6 pt-0"},[a("v-row",[a("v-col",[a("label",{staticClass:"text-sm text-body"},[t._v("Nombres")]),a("p",{staticClass:"text-sm text-body-1 text-uppercase"},[t._v(" "+t._s(t.data.name)+" ")])]),a("v-col",[a("label",{staticClass:"text-sm text-body"},[t._v("Apellidos")]),a("p",{staticClass:"text-sm text-body-1 text-uppercase"},[t._v(" "+t._s(t.data.surname)+" ")])])],1),a("v-divider"),a("v-row",[a("v-col",[a("label",{staticClass:"text-sm text-body"},[t._v("Tipo de identificaci\xF3n")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.data.identification_type)+" ")])]),a("v-col",[a("label",{staticClass:"text-sm text-body"},[t._v("Numero de identificaci\xF3n")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.showNumericFormat(t.data.identification_number))+" ")])])],1),a("v-divider"),a("v-row",{staticClass:"mt-0"},[a("v-col",[a("label",{staticClass:"text-sm text-body"},[t._v("Genero")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.data.gender)+" ")])]),a("v-col",[a("label",{staticClass:"text-sm text-body"},[t._v("Tipo de sangre")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.data.blood_type)+" ")])]),a("v-col",[a("label",{staticClass:"text-sm text-body"},[t._v("Fecha de nacimiento")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.getDate(t.data.birthday_date))+" ")])]),a("v-col",[a("label",{staticClass:"text-sm text-body"},[t._v("Edad")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.getYearsOld(t.data.birthday_date))+" a\xF1os ")])])],1),a("v-divider")],1)]),a("v-card",{staticClass:"card-shadow rounded-lg mt-6"},[a("div",{staticClass:"px-6 py-6"},[a("h5",{staticClass:"text-h5 font-weight-bold text-typo"},[t._v(" Informaci\xF3n de contacto ")])]),a("div",{staticClass:"px-6 pb-6 pt-0"},[a("v-row",[a("v-col",{staticClass:"col col-6"},[a("label",{staticClass:"text-sm text-body"},[t._v("Correo electr\xF3nico")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.data.email)+" ")])]),a("div",{staticClass:"col col-6"},[a("label",{staticClass:"text-sm text-body"},[t._v("Numero de tel\xE9fono")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.data.phone)+" ")])])],1),a("v-divider"),a("v-row",{staticClass:"mt-0"},[a("v-col",{staticClass:"col-sm-4 col-12"},[a("label",{staticClass:"text-sm text-body"},[t._v("Direcci\xF3n de residencia")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.data.phone)+" ")])]),a("v-col",{staticClass:"col-sm-4 col-12"},[a("label",{staticClass:"text-sm text-body"},[t._v("Municipio")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.data.municipality)+" ")])]),a("v-col",{staticClass:"col-sm-4 col-12"},[a("label",{staticClass:"text-sm text-body"},[t._v("Departamento")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.data.department)+" ")])])],1),a("v-divider")],1)]),a("v-card",{staticClass:"card-shadow rounded-lg mt-6"},[a("div",{staticClass:"px-6 py-6"},[a("h5",{staticClass:"text-h5 font-weight-bold text-typo"},[t._v(" Informaci\xF3n de establecimiento ")])]),a("div",{staticClass:"px-6 pb-6 pt-0"},[a("v-row",[a("v-col",{staticClass:"col col-6"},[a("label",{staticClass:"text-sm text-body"},[t._v("Instituci\xF3n")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.establishment.name)+" ")])]),a("div",{staticClass:"col col-6"},[a("label",{staticClass:"text-sm text-body"},[t._v("Sede")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.headquarters.name)+" ")])])],1),a("v-divider")],1)]),t.data.attended_by?a("v-card",{staticClass:"card-shadow rounded-lg mt-6"},[a("div",{staticClass:"px-6 py-6"},[a("h5",{staticClass:"text-h5 font-weight-bold text-typo"},[t._v(" Informaci\xF3n de acudientes ")])]),a("div",{staticClass:"px-6 pb-6 pt-0"},[a("v-row",[a("v-col",[a("label",{staticClass:"text-sm text-body"},[t._v("Nombres de acudiente")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.attended.name)+" "+t._s(t.attended.surname)+" ")])]),a("v-col",[a("label",{staticClass:"text-sm text-body"},[t._v("Tipo de parentesco")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.data.relationship)+" ")])]),a("v-col",[a("label",{staticClass:"text-sm text-body"},[t._v("Direcci\xF3n de residencia")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.attended.direction)+" ")])])],1),a("v-divider"),a("v-row",[a("v-col",{staticClass:"col col-6"},[a("label",{staticClass:"text-sm text-body"},[t._v("Correo electr\xF3nico")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.attended.email)+" ")])]),a("div",{staticClass:"col col-6"},[a("label",{staticClass:"text-sm text-body"},[t._v("Numero de tel\xE9fono")]),a("p",{staticClass:"text-sm text-body-1"},[t._v(" "+t._s(t.attended.phone)+" ")])])],1)],1)]):t._e()],1)],1)],1)],1)},n=[],m=d(c,r,n,!1,null,"0aa50164",null,null);const y=m.exports;export{y as default};
