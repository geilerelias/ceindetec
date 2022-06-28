<template>
    <div>
        <v-list dense>
            <v-list-item v-for="(item, i) in registro" :key="item.id">
                <v-list-item-avatar size="28" class="primary white--text" v-text="i+1"/>
                <v-list-item-content class="texto">
                    <span>{{ item }}</span>
                </v-list-item-content>
            </v-list-item>
        </v-list>
    </div>
</template>

<script>
export default {
    name: "ShowDataFile",
    props: ['link'],
    data: () => ({
        registro: null
    }),
    created() {
        axios
            .get(this.link)
            .then((file) => {
                //console.log(file.data)
                this.registro = file.data.trim(' ').split('\n')
                //console.log("type => ", typeof this.registro)
                //console.log("registro => ", this.registro)
                return file
            })
    },
    mounted() {
    },
    updated() {

    }

}
</script>

<style>
.texto {
    text-transform: lowercase;
}

.texto span:first-letter {
    text-transform: uppercase;
}

</style>
