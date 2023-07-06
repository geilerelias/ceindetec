import{A as a}from"./AppLayout.7e6a42a7.js";import{B as o}from"./BreadCrumbs.14245490.js";import{n}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.69c5493d.js";import"./app.77aa44cf.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.da80baee.js";const c={name:"Index",components:{BreadCrumbs:o,AppLayout:a},props:["tickets"],data:()=>({headers:[{text:"T\xEDtulo",value:"title"},{text:"Usuario",value:"user_id"},{text:"Categor\xEDa",value:"category_id"},{text:"Prioridad",value:"priority"},{text:"Mensaje",value:"message"},{text:"Estado",value:"status"},{text:"Acciones",value:"actions"}],search:"",pagination:{},loading:!1,selectedItem:1,items:[{text:"Error en red",icon:"mdi-tag"},{text:"Inconveniente con el cargue de archivo",icon:"mdi-tag"},{text:"No puedo registrar estudiantes",icon:"mdi-tag"}],links:[{text:"Dashboard",disabled:!1,href:"/dashboard"},{text:"Tickets",disabled:!0,href:"/dashboard/ticket"}],categories:[],users:[]}),mounted(){axios.get(route("ticket-category.all")).then(t=>{this.categories=t.data}).catch(t=>t),this.fetchTickets()},methods:{getPriorityColor(t){switch(t){case"Alta":return"red";case"Media":return"orange";case"Baja":return"green";default:return"grey"}},getPriorityIcon(t){switch(t){case"alta":return"mdi-flag-outline";case"media":return"mdi-flag-triangle";case"baja":return"mdi-flag-checkered";default:return"mdi-flag"}},getStatusColor(t){switch(t){case"Open":return"green";case"Closed":return"red";default:return"grey"}},getStatusName(t){switch(t){case"Open":return"Abierto";case"Closed":return"Cerrado";default:return"grey"}},editTicket(t){},deleteTicket(t){t._method="DELETE",this.$swal.fire({title:"\xBFEst\xE1s seguro?",text:"Esta acci\xF3n no se puede deshacer",icon:"warning",showCancelButton:!0,cancelButtonColor:"#3085d6",confirmButtonColor:"#d33",confirmButtonText:"S\xED, eliminar",cancelButtonText:"Cancelar"}).then(e=>{e.isConfirmed&&this.$inertia.post(route("ticket.destroy",t.id),t,{onSuccess:r=>{this.$swal({icon:`${r.props.errors.message?"error":"success"}`,title:`${r.props.errors.message?"Ups...":"\xA1Buen trabajo!"}`,text:`${r.props.errors.message?r.props.errors.message:r.props.flash.message}`})},onError:r=>{this.$swal("\xA1Ay...!","Disculpe, ocurri\xF3 un error.","warning")},onFinish:r=>{this.loadingDeleteItem=!1}})})},getItems(){this.$inertia.get(route("ticket.index"),{onSuccess:t=>{this.tickets=t},onError:t=>{console.error(t)}})},async getUserNameFromId(t){this.userName=await axios.get(`/user/by/${t}`)},onPageChange(t){this.currentPage=t,this.getItems()},getCategoryById(t){try{return this.categories.find(r=>r.id===t).name}catch{}},async fetchTickets(){try{for(const t of this.tickets){const e=await this.getUserNameById(t.user_id);this.$set(this.users,t.user_id,e)}}catch(t){console.error(t)}},async getUserNameById(t){try{return(await axios.get("/user/by/"+t)).data}catch(e){return console.error(e),"No definido"}},viewTicket(t){this.$inertia.visit(`/dashboard/ticket/${t.id}`)}}};var d=function(){var e=this,r=e._self._c;return r("app-layout",[r("bread-crumbs",{attrs:{items:e.links,name:"Mis Tickets de Soporte"}}),r("v-container",[r("v-card",{staticStyle:{width:"100%"}},[r("v-card-text",{},[r("v-row",{staticClass:"no-gutters"},[r("div",{staticClass:"d-flex justify-space-between justify-md-start col-md-6 col-12"},[r("v-btn",{attrs:{color:"primary"},on:{click:function(s){e.$inertia.visit(e.route("ticket.create"))}}},[r("v-icon",{staticClass:"notranslate mr-2"},[e._v(" mdi-plus ")]),e._v(" Agregar ")],1)],1),r("v-spacer"),r("div",{staticClass:"mx-auto mt-4 mt-md-0",staticStyle:{"max-width":"250px"}},[r("v-text-field",{attrs:{"append-icon":"mdi-magnify",dense:"",enclosed:"","hide-details":"",outlined:"",placeholder:"Buscar"},model:{value:e.search,callback:function(s){e.search=s},expression:"search"}})],1)],1)],1)],1),r("v-card",{staticClass:"mt-4"},[r("v-card-text",[r("v-data-table",{attrs:{headers:e.headers,items:e.tickets,loading:e.loading,search:e.search},scopedSlots:e._u([{key:"item.priority",fn:function({item:s}){return[r("div",{staticClass:"d-flex"},[r("v-chip",{attrs:{color:e.getPriorityColor(s.priority),dark:""}},[e._v(e._s(s.priority)+" ")])],1)]}},{key:"item.user_id",fn:function({item:s}){return[e._v(" "+e._s(e.users[s.user_id])+" ")]}},{key:"item.category_id",fn:function({item:s}){return[e._v(" "+e._s(e.getCategoryById(s.category_id))+" ")]}},{key:"item.status",fn:function({item:s}){return[r("v-chip",{attrs:{color:e.getStatusColor(s.status),dark:""}},[e._v(" "+e._s(e.getStatusName(s.status))+" ")])]}},{key:"item.message",fn:function({item:s}){return[r("div",{domProps:{innerHTML:e._s(s.message)}})]}},{key:"item.actions",fn:function({item:s}){return[r("div",{staticClass:"d-flex"},[r("v-btn",{attrs:{icon:""},on:{click:function(i){e.$inertia.visit(e.route("ticket.edit",s.id))}}},[r("v-icon",[e._v(" mdi-pencil")])],1),r("v-btn",{attrs:{icon:""},on:{click:function(i){return e.deleteTicket(s)}}},[r("v-icon",[e._v("mdi-delete")])],1),r("v-btn",{attrs:{icon:""},on:{click:function(i){return e.viewTicket(s)}}},[r("v-icon",[e._v("mdi-eye")])],1)],1)]}}])})],1)],1)],1)],1)},u=[],l=n(c,d,u,!1,null,"b0869bef",null,null);const k=l.exports;export{k as default};