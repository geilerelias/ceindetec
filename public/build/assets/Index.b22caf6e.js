import{A as o}from"./AppLayout.7e6a42a7.js";import{B as i}from"./BreadCrumbs.14245490.js";import{n}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Footer.69c5493d.js";import"./app.77aa44cf.js";import"./logo-ceindetec.0997e866.js";import"./Logo.5a18e3f9.js";import"./SettingsDropdown.da80baee.js";const c={name:"User",components:{AppLayout:o,BreadCrumbs:i},props:["data","errors"],data:()=>({loading:!1,headers:[{text:"Photo",value:"profile_photo_url"},{text:"Name",value:"name"},{text:"Email",value:"email"}],headersRole:[{text:"Id",align:"start",sortable:!1,value:"id"},{text:"Name",value:"name"},{text:"Actions",value:"actions",sortable:!1}],selectedRole:[],search:"",items:[{text:"Dashboard",disabled:!1,href:"/dashboard"},{text:"Users",disabled:!0,href:"/user"}],selectedUser:[],role:[],searchRole:"",users:[]}),created(){axios.get("role/all").then(r=>{this.role=r.data}).catch(r=>{this.$swal("Opps...!","Excuse me, an error occurred.","warning")}),this.users=this.data;for(const r in this.users){let t=this.users[r];axios.get(`/user/${t.id}/roles`).then(e=>{this.users[r].roles=e.data}).catch(e=>{this.$swal("Opps...!","Excuse me, an error occurred.","warning")})}},watch:{selectedUser(r){if(r.length>0){this.selectedRole=[];let t=r[0].roles;for(const e in t){let s=this.role.find(a=>a.name===t[e]);this.selectedRole.push(s)}}}},methods:{removeRole(r){console.log(r),this.$swal({title:"Are you sure you want to delete this item?",text:"You won't be able to revert this!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Yes, delete it!"}).then(t=>{if(t.isConfirmed){let e={role:r,user:this.selectedUser[0].id};this.$inertia.post("user/remove/roles",e,{onSuccess:s=>{console.log(s),this.$swal("Deleted!",this.$page.flash.message,"success")},onError:s=>{this.$swal("Opps...!","Excuse me, an error occurred.","warning")}}),this.$nextTick(()=>{this.editedItem=Object.assign({},this.defaultItem),this.editedIndex=-1})}})},isSelected(r){var t=this.selectedRole.indexOf(r);return t!=-1},grantRoles(){if(this.selectedUser.length>0)if(console.log("selectedRole",this.selectedRole.length),this.selectedRole.length>0){let r=[];for(let e=0;e<this.selectedRole.length;e++)r.push(this.selectedRole[e].name);let t={user:this.selectedUser[0].id,role:r};this.$inertia.post("/user/assign/roles",t,{onStart:e=>{console.log("onStart",e),this.loading=!0},onSuccess:e=>{this.$swal({icon:`${e.props.errors.name?"error":"success"}`,title:`${e.props.errors.name?"Oops...":"Good job!"}`,text:`${e.props.errors.name?e.props.errors.name[0]:e.props.flash.message}`})},onError:e=>{this.$swal("Opps...!","Excuse me, an error occurred.","warning")},onFinish:e=>{this.loading=!1}})}else this.$swal("Opps...!","you must select a rol.","warning");else this.$swal("Opps...!","you must select a user.","warning")},initialize(){location.reload()}}};var d=function(){var t=this,e=t._self._c;return e("app-layout",[e("bread-crumbs",{attrs:{name:"Users",items:t.items}}),e("v-container",{staticClass:"d-flex justify-center"},[e("div",[e("v-data-table",{staticClass:"elevation-1",attrs:{headers:t.headers,items:t.data,"sort-by":"name",search:t.search,"single-select":"","single-expand":"","show-select":"","show-expand":""},scopedSlots:t._u([{key:"top",fn:function(){return[e("v-toolbar",{attrs:{flat:""}},[e("v-text-field",{staticClass:"mr-3",attrs:{"append-icon":"mdi-magnify",label:"Search","single-line":"","hide-details":""},model:{value:t.search,callback:function(s){t.search=s},expression:"search"}}),e("v-divider",{staticClass:"mx-4",attrs:{inset:"",vertical:""}}),e("v-spacer"),e("inertia-link",{attrs:{href:t.route("user.create")}},[e("v-btn",{staticClass:"mb-2",attrs:{color:"primary",dark:""}},[t._v(" New Item ")])],1)],1)]},proxy:!0},{key:"item.profile_photo_url",fn:function({item:s}){return[e("div",{staticClass:"d-flex align-center py-4"},[e("v-btn",{attrs:{fab:"",dark:"",text:"",small:""}},[e("v-img",{staticClass:"rounded-circle",staticStyle:{"max-height":"35px","max-width":"35px"},attrs:{cover:"",src:s.profile_photo_url,alt:s.name}})],1)],1)]}},{key:"expanded-item",fn:function({headers:s,item:a}){return[e("td",{attrs:{colspan:s.length}},[t._v(" established roles: "),t._l(a.roles,function(l){return e("v-chip",{key:l.id,staticClass:"ma-2 white--text",attrs:{color:"indigo",small:""}},[t._v(" "+t._s(l)+" ")])})],2)]}},{key:"no-data",fn:function(){return[e("v-btn",{attrs:{color:"primary"},on:{click:t.initialize}},[t._v(" Reset ")])]},proxy:!0}]),model:{value:t.selectedUser,callback:function(s){t.selectedUser=s},expression:"selectedUser"}})],1)]),e("v-container",[e("v-card",[e("v-toolbar",{attrs:{flat:""}},[e("v-toolbar-title",[t._v("Roles")]),e("v-spacer"),t.selectedUser.length>0?e("span",[t._v("selected User "+t._s(t.selectedUser[0].name))]):e("span",[t._v(" User not selected")])],1),e("v-banner",{attrs:{"single-line":""},scopedSlots:t._u([{key:"actions",fn:function(){return[e("v-btn",{attrs:{text:"",color:"deep-purple accent-4",loading:t.loading,disabled:t.loading},on:{click:t.grantRoles}},[t._v(" grant Roles ")])]},proxy:!0}])},[t._v(" choose the Roles for the selected role. ")]),e("v-card-text",{staticClass:"grey lighten-4"},[e("v-sheet",{staticClass:"mx-auto",attrs:{"max-width":"500"}},[e("div",[e("v-data-table",{staticClass:"elevation-1",attrs:{headers:t.headersRole,items:t.role,"sort-by":"calories",search:t.searchRole,"show-select":""},scopedSlots:t._u([{key:"top",fn:function(){return[e("v-toolbar",{attrs:{flat:""}},[e("v-text-field",{staticClass:"mx-auto",attrs:{"append-icon":"mdi-magnify",label:"Search","single-line":"","hide-details":""},model:{value:t.searchRole,callback:function(s){t.searchRole=s},expression:"searchRole"}})],1)]},proxy:!0},{key:"item.actions",fn:function({item:s}){return[e("div",{staticClass:"d-flex align-center py-4"},[t.isSelected(s)?[e("v-btn",{staticClass:"primary--text",attrs:{icon:""},on:{click:function(a){return t.removeRole(s)}}},[e("v-icon",[t._v(" mdi-close-circle ")])],1)]:e("v-btn",{staticClass:"primary--text",attrs:{icon:"",disabled:""}},[e("v-icon",[t._v(" mdi-close-circle ")])],1)],2)]}}]),model:{value:t.selectedRole,callback:function(s){t.selectedRole=s},expression:"selectedRole"}})],1)])],1)],1)],1)],1)},u=[],h=n(c,d,u,!1,null,"cbc334d2",null,null);const y=h.exports;export{y as default};