import{S as i}from"./SimpleLayout.903ef5f3.js";import{n}from"./_plugin-vue2_normalizer.358ffe07.js";import"./Logo.5a18e3f9.js";import"./logo-ceindetec.0997e866.js";import"./SettingsDropdown.da80baee.js";const a=new faceIO("fioa2d9a");window.faceio=a;const c={name:"FaceIdentification",components:{SimpleLayout:i},data(){return{user:""}},methods:{login(){window.faceio.authenticate({locale:"auto"}).then(t=>{console.log("Success, user identified"),console.log("Linked facial Id: "+t.facialId),console.log("Payload: "+JSON.stringify(t.payload)),this.user=t.payload.whoami}).catch(t=>{console.log(t)})},authenticateUser(){a.authenticate({locale:"auto"}).then(t=>{console.log("Success, user identified"),console.log("Linked facial Id: "+t.facialId),console.log("Payload: "+JSON.stringify(t.payload))}).catch(t=>{handleError(t)})},register(){window.faceio.enroll({locale:"auto",payload:{whoami:123456,email:"john.doe@example.com"}}).then(t=>{alert(`User Successfully Enrolled! Details:
           Unique Facial ID: ${t.facialId}
           Enrollment Date: ${t.timestamp}
           Gender: ${t.details.gender}
           Age Approximation: ${t.details.age}`),console.log(t)}).catch(t=>{console.log(t)})},logout(){this.user=""}}};var l=function(){var e=this,o=e._self._c;return o("simple-layout",{staticClass:"Authentication",attrs:{extension:!1},scopedSlots:e._u([{key:"header",fn:function(){return[o("div",{staticClass:"text-h5 white--text font-weight-bold text-uppercase text-center justify-center"},[e._v(" Reconocimiento facial ")])]},proxy:!0}])},[o("h1",[e._v("Face recognition with FaceIO")]),o("div",{staticClass:"container"},[e.user===""?o("div",{staticClass:"btn",on:{click:e.login}},[e._v("Sign in")]):e._e(),e.user===""?o("div",{staticClass:"btn",on:{click:e.authenticateUser}},[e._v("authenticateUser")]):e._e(),e.user===""?o("div",{staticClass:"btn",on:{click:e.register}},[e._v("Register")]):e._e(),e.user!==""?o("div",{staticClass:"btn",on:{click:e.logout}},[e._v("Log out")]):e._e()]),o("div",{attrs:{id:"faceio-modal"}})])},s=[],r=n(c,l,s,!1,null,"e8b68e7d",null,null);const g=r.exports;export{g as default};
