import{n as r}from"./_plugin-vue2_normalizer.358ffe07.js";const i={name:"ShowDataFile",props:["link"],data:()=>({registro:null}),created(){axios.get(this.link).then(s=>(this.registro=s.data.trim(" ").split(`
`),s))},mounted(){},updated(){}};var o=function(){var t=this,e=t._self._c;return e("div",[e("v-list",{attrs:{dense:""}},t._l(t.registro,function(n,a){return e("v-list-item",{key:n.id},[e("v-list-item-avatar",{staticClass:"primary white--text",attrs:{size:"28"},domProps:{textContent:t._s(a+1)}}),e("v-list-item-content",{staticClass:"texto"},[e("span",[t._v(t._s(n))])])],1)}),1)],1)},l=[],_=r(i,o,l,!1,null,null,null,null);const d=_.exports;export{d as s};
