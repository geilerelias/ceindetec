import{J as i}from"./Modal.ad2d7f8e.js";import{J as s}from"./Button.186b2831.js";import{J as c}from"./DialogModal.5d29c1a3.js";import{J as d,a as l}from"./InputError.e00842e5.js";import{J as n}from"./SecondaryButton.c6e6eeac.js";import{n as a}from"./_plugin-vue2_normalizer.358ffe07.js";import{J as u}from"./DangerButton.bc0a3d2c.js";import"./SectionTitle.c7331ac0.js";const f={props:{title:{default:"Confirm Password"},content:{default:"For your security, please confirm your password to continue."},button:{default:"Confirm"}},components:{JetButton:s,JetDialogModal:c,JetInput:d,JetInputError:l,JetSecondaryButton:n},data(){return{confirmingPassword:!1,form:this.$inertia.form({password:"",error:""},{bag:"confirmPassword"})}},methods:{startConfirmingPassword(){this.form.error="",axios.get(route("password.confirmation").url()).then(o=>{o.data.confirmed?this.$emit("confirmed"):(this.confirmingPassword=!0,this.form.password="",setTimeout(()=>{this.$refs.password.focus()},250))})},confirmPassword(){this.form.processing=!0,axios.post(route("password.confirm").url(),{password:this.form.password}).then(o=>{this.confirmingPassword=!1,this.form.password="",this.form.error="",this.form.processing=!1,this.$nextTick(()=>this.$emit("confirmed"))}).catch(o=>{this.form.processing=!1,this.form.error=o.response.data.errors.password[0]})}}};var m=function(){var t=this,e=t._self._c;return e("span",[e("span",{on:{click:t.startConfirmingPassword}},[t._t("default")],2),e("jet-dialog-modal",{attrs:{show:t.confirmingPassword},on:{close:function(r){t.confirmingPassword=!1}},scopedSlots:t._u([{key:"title",fn:function(){return[t._v(" "+t._s(t.title)+" ")]},proxy:!0},{key:"content",fn:function(){return[t._v(" "+t._s(t.content)+" "),e("div",{staticClass:"mt-4"},[e("jet-input",{ref:"password",staticClass:"mt-1 block w-3/4",attrs:{type:"password",placeholder:"Password"},nativeOn:{keyup:function(r){return!r.type.indexOf("key")&&t._k(r.keyCode,"enter",13,r.key,"Enter")?null:t.confirmPassword.apply(null,arguments)}},model:{value:t.form.password,callback:function(r){t.$set(t.form,"password",r)},expression:"form.password"}}),e("jet-input-error",{staticClass:"mt-2",attrs:{message:t.form.error}})],1)]},proxy:!0},{key:"footer",fn:function(){return[e("jet-secondary-button",{nativeOn:{click:function(r){t.confirmingPassword=!1}}},[t._v(" Nevermind ")]),e("jet-button",{staticClass:"ml-2",class:{"opacity-25":t.form.processing},attrs:{disabled:t.form.processing},nativeOn:{click:function(r){return t.confirmPassword.apply(null,arguments)}}},[t._v(" "+t._s(t.button)+" ")])]},proxy:!0}])})],1)},p=[],h=a(f,m,p,!1,null,null,null,null);const w=h.exports,v={components:{JetActionSection:i,JetButton:s,JetConfirmsPassword:w,JetDangerButton:u,JetSecondaryButton:n},data(){return{enabling:!1,disabling:!1,qrCode:null,recoveryCodes:[]}},methods:{enableTwoFactorAuthentication(){this.enabling=!0,this.$inertia.post("/user/two-factor-authentication",{},{preserveScroll:!0}).then(()=>Promise.all([this.showQrCode(),this.showRecoveryCodes()])).then(()=>{this.enabling=!1})},showQrCode(){return axios.get("/user/two-factor-qr-code").then(o=>{this.qrCode=o.data.svg})},showRecoveryCodes(){return axios.get("/user/two-factor-recovery-codes").then(o=>{this.recoveryCodes=o.data})},regenerateRecoveryCodes(){axios.post("/user/two-factor-recovery-codes").then(o=>{this.showRecoveryCodes()})},disableTwoFactorAuthentication(){this.disabling=!0,this.$inertia.delete("/user/two-factor-authentication",{preserveScroll:!0}).then(()=>{this.disabling=!1})}},computed:{twoFactorEnabled(){return!this.enabling&&this.$page.props.user.two_factor_enabled}}};var y=function(){var t=this,e=t._self._c;return e("jet-action-section",{scopedSlots:t._u([{key:"title",fn:function(){return[t._v(" Two Factor Authentication ")]},proxy:!0},{key:"description",fn:function(){return[t._v(" Add additional security to your account using two factor authentication. ")]},proxy:!0},{key:"content",fn:function(){return[t.twoFactorEnabled?e("h3",{staticClass:"text-lg font-medium text-gray-900"},[t._v(" You have enabled two factor authentication. ")]):e("h3",{staticClass:"text-lg font-medium text-gray-900"},[t._v(" You have not enabled two factor authentication. ")]),e("div",{staticClass:"mt-3 max-w-xl text-sm text-gray-600"},[e("p",[t._v(" When two factor authentication is enabled, you will be prompted for a secure, random token during authentication. You may retrieve this token from your phone's Google Authenticator application. ")])]),t.twoFactorEnabled?e("div",[t.qrCode?e("div",[e("div",{staticClass:"mt-4 max-w-xl text-sm text-gray-600"},[e("p",{staticClass:"font-semibold"},[t._v(" Two factor authentication is now enabled. Scan the following QR code using your phone's authenticator application. ")])]),e("div",{staticClass:"mt-4 dark:p-4 dark:w-56 dark:bg-white",domProps:{innerHTML:t._s(t.qrCode)}})]):t._e(),t.recoveryCodes.length>0?e("div",[e("div",{staticClass:"mt-4 max-w-xl text-sm text-gray-600"},[e("p",{staticClass:"font-semibold"},[t._v(" Store these recovery codes in a secure password manager. They can be used to recover access to your account if your two factor authentication device is lost. ")])]),e("div",{staticClass:"grid gap-1 max-w-xl mt-4 px-4 py-4 font-mono text-sm bg-gray-100 rounded-lg"},t._l(t.recoveryCodes,function(r){return e("div",{key:r},[t._v(" "+t._s(r)+" ")])}),0)]):t._e()]):t._e(),e("div",{staticClass:"mt-5"},[t.twoFactorEnabled?e("div",[e("jet-confirms-password",{on:{confirmed:t.regenerateRecoveryCodes}},[t.recoveryCodes.length>0?e("jet-secondary-button",{staticClass:"mr-3"},[t._v(" Regenerate Recovery Codes ")]):t._e()],1),e("jet-confirms-password",{on:{confirmed:t.showRecoveryCodes}},[t.recoveryCodes.length==0?e("jet-secondary-button",{staticClass:"mr-3"},[t._v(" Show Recovery Codes ")]):t._e()],1),e("jet-confirms-password",{on:{confirmed:t.disableTwoFactorAuthentication}},[e("jet-danger-button",{class:{"opacity-25":t.disabling},attrs:{disabled:t.disabling}},[t._v(" Disable ")])],1)],1):e("div",[e("jet-confirms-password",{on:{confirmed:t.enableTwoFactorAuthentication}},[e("jet-button",{class:{"opacity-25":t.enabling},attrs:{type:"button",disabled:t.enabling}},[t._v(" Enable ")])],1)],1)])]},proxy:!0}])})},g=[],_=a(v,y,g,!1,null,null,null,null);const $=_.exports;export{$ as default};
