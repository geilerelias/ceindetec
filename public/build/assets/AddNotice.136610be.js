import{P as s}from"./PictureInput.1e25d6a4.js";import{h as n}from"./moment.9709ab41.js";import l from"./Links.b5b07a7d.js";import{V as r}from"./vue2-editor.esm.38499d69.js";import{n as c}from"./_plugin-vue2_normalizer.358ffe07.js";import"./app.1e841923.js";n.locale("es");const d={components:{VueEditor:r,"picture-input":s,"links-component":l},name:"add-notice",data:()=>({content:"<h1>Some initial content</h1>",imageMiniatura:"",menu:!1,menu2:!1,valid:!0,lazy:!1,snackbar:!1,response:"",notice:{image:"",title:"",city:"",date:"",time:"",description:"",links:[]},titleRules:[o=>!!o||"El t\xEDtulo es requerido"],cityRules:[o=>!!o||"La ciudad o lugar son requeridas"],dateRules:[o=>!!o||"La fecha es requerida"],timeRules:[o=>!!o||"La hora es requerida"],descriptionRules:[o=>!!o||"La descripci\xF3n es requerida"],imageRules:[o=>!o||o.size<5e6||"El tama\xF1o de la imagen debe ser inferior a 5 MB!"],customStrings:{upload:"<p> Su dispositivo no admite la carga de archivos. </p>",drag:"Arrastre una imagen o <br> haga clic aqu\xED para seleccionar \u{1F63C}",tap:"Toque aqu\xED para seleccionar una foto <br> de su galer\xEDa",change:"Cambiar",remove:"Eliminar",select:"Selecciona una foto",fileType:"Este tipo de archivo no es compatible."}}),methods:{customButtonClick(){alert(`You can custom the button and listen click event to do something...
\u4F60\u53EF\u4EE5\u5B9A\u4E49\u4E00\u4E9B\u81EA\u5B9A\u4E49\u6309\u94AE\u505A\u4F60\u60F3\u505A\u7684\u4E8B\uFF0C\u5982\u4E0A\u4F20\u56FE\u7247\u81F3\u7B2C\u4E09\u65B9\u5B58\u50A8\u518D\u63D2\u5165\u5185\u5BB9\u533A...\u7B49\u7B49`)},deleteAllItem(){this.$refs.linksComponents.deleteAllItem()},removeImage(){this.$refs.pictureInput.removeImage()},closeDialog(){this.$emit("closeDialog",!1)},onChange(o){console.log("New picture selected!"),o?(console.log("Picture loaded."),this.notice.image=this.$refs.pictureInput.file,console.log(this.$refs.pictureInput.file)):console.log("FileReader API not supported: use the <form>, Luke!")},savedNotice(o){this.$emit("addNotice",o)},addNotice(){let o=new FormData;o.append("image",this.notice.image),o.append("title",this.notice.title),o.append("city",this.notice.city),o.append("date",this.notice.date),o.append("time",this.notice.time),o.append("description",this.notice.description),o.append("links",this.notice.links),console.log(o),axios.post("/notices",o).then(e=>{let t=e.data;console.log("este es response",e.data),this.$swal("Agregada!","Su noticia ha sido agregada exitosamente!","success").then(i=>{this.savedNotice(t),this.notice.image="",this.notice.title="",this.notice.city="",this.notice.date="",this.notice.time="",this.notice.description="",this.notice.links=[],this.removeImage(),this.closeDialog(),this.reset()}),console.log(e.data)}).catch(e=>{console.log(e);const t=e.response.data.errors;let i="";for(var a in t)i+=a+": "+t[a]+`
 `;this.$swal("Error!",i,"error"),console.log(i)})},validate(){!this.$refs.form.validate()||this.addNotice()},reset(){this.$refs.form.reset()},resetValidation(){this.$refs.form.resetValidation()}},computed:{computedDateFormattedMomentjs(){return this.notice.date?n(this.notice.date).format("dddd, D MMMM YYYY"):""}}};var u=function(){var e=this,t=e._self._c;return t("v-card",{staticClass:"rounded-0"},[t("v-toolbar",{attrs:{dark:""}},[t("v-btn",{attrs:{icon:"",dark:""},on:{click:e.closeDialog}},[t("v-icon",[e._v("mdi-close")])],1),t("v-toolbar-title",[e._v("Registro de noticia")]),t("div",{staticClass:"flex-grow-1"}),t("v-toolbar-items",[t("v-btn",{staticClass:"mr-4",attrs:{text:"",disabled:!e.valid},on:{click:e.validate}},[e._v(" Registrar ")])],1)],1),t("v-container",{attrs:{fluid:""}},[t("v-card-text",[t("v-form",{ref:"form",attrs:{"lazy-validation":e.lazy,enctype:"multipart/form-data"},on:{submit:function(i){return i.preventDefault(),e.addNotice.apply(null,arguments)}},model:{value:e.valid,callback:function(i){e.valid=i},expression:"valid"}},[t("v-row",[t("v-col",{attrs:{cols:"12"}},[t("picture-input",{ref:"pictureInput",attrs:{crop:!1,width:e.$vuetify.breakpoint.xsOnly?300:1e3,height:e.$vuetify.breakpoint.xsOnly?200:300,zIndex:0,accept:"image/jpeg,image/png",removable:!0,"button-class":"v-btn v-btn--contained theme--light v-size--small info",removeButtonClass:"v-btn v-btn--contained theme--light v-size--small error",customStrings:e.customStrings},on:{change:e.onChange}})],1),t("v-col",{attrs:{cols:"12"}},[t("v-text-field",{attrs:{clearable:"",rules:e.titleRules,label:"T\xEDtulo",required:""},model:{value:e.notice.title,callback:function(i){e.$set(e.notice,"title",i)},expression:"notice.title"}})],1),t("v-col",{attrs:{sm:"4",cols:"12"}},[t("v-text-field",{attrs:{clearable:"",rules:e.cityRules,label:"Ciudad o lugar",required:""},model:{value:e.notice.city,callback:function(i){e.$set(e.notice,"city",i)},expression:"notice.city"}})],1),t("v-col",{attrs:{sm:"4",cols:"12"}},[t("v-menu",{attrs:{"close-on-content-click":!1,transition:"scale-transition","max-width":"290"},scopedSlots:e._u([{key:"activator",fn:function({on:i}){return[t("v-text-field",e._g({attrs:{value:e.computedDateFormattedMomentjs,rules:e.dateRules,clearable:"",label:"Fecha",readonly:""}},i))]}}]),model:{value:e.menu,callback:function(i){e.menu=i},expression:"menu"}},[t("v-date-picker",{attrs:{locale:"es"},on:{change:function(i){e.menu=!1}},model:{value:e.notice.date,callback:function(i){e.$set(e.notice,"date",i)},expression:"notice.date"}})],1)],1),t("v-col",{attrs:{sm:"4",cols:"12"}},[t("v-menu",{ref:"menu",attrs:{"close-on-content-click":!1,"nudge-right":40,"return-value":e.notice.time,transition:"scale-transition","offset-y":"","max-width":"290px","min-width":"290px"},on:{"update:returnValue":function(i){return e.$set(e.notice,"time",i)},"update:return-value":function(i){return e.$set(e.notice,"time",i)}},scopedSlots:e._u([{key:"activator",fn:function({on:i}){return[t("v-text-field",e._g({attrs:{label:"Hora",rules:e.timeRules,readonly:""},model:{value:e.notice.time,callback:function(a){e.$set(e.notice,"time",a)},expression:"notice.time"}},i))]}}]),model:{value:e.menu2,callback:function(i){e.menu2=i},expression:"menu2"}},[e.menu2?t("v-time-picker",{attrs:{"full-width":""},on:{"click:minute":function(i){return e.$refs.menu.save(e.notice.time)}},model:{value:e.notice.time,callback:function(i){e.$set(e.notice,"time",i)},expression:"notice.time"}}):e._e()],1)],1)],1),t("v-label",{attrs:{for:"myTextEditor"}},[e._v("Descripci\xF3n")]),t("vue-editor",{ref:"myTextEditor",attrs:{rules:e.descriptionRules},model:{value:e.notice.description,callback:function(i){e.$set(e.notice,"description",i)},expression:"notice.description"}})],1),t("links-component",{ref:"linksComponents",staticClass:"mt-4",attrs:{link:e.notice.links},on:{addLink:function(i){e.notice.links=i}}})],1),t("v-card-actions",[t("div",{staticClass:"flex-grow-1"}),t("v-btn",{staticClass:"mr-4",attrs:{color:"warning"},on:{click:e.reset}},[e._v(" Reset Form ")]),t("v-btn",{staticClass:"mr-4",attrs:{color:"success",disabled:!e.valid},on:{click:e.validate}},[e._v(" Registrar ")])],1)],1)],1)},m=[],p=c(d,u,m,!1,null,null,null,null);const x=p.exports;export{x as default};
