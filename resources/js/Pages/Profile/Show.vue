<template>
    <app-layout>
        <bread-crumbs name="Profile" :items="items"></bread-crumbs>


        <div>
            <div class="max-w-7xl mx-auto py-10 sm:px-6 lg:px-8">
                <div v-if="$page.props.jetstream.canUpdateProfileInformation">
                    <update-profile-information-form :user="$page.props.user"/>

                    <jet-section-border/>
                </div>

                <div v-if="$page.props.jetstream.canUpdatePassword">
                    <update-password-form class="mt-10 sm:mt-0"/>

                    <jet-section-border/>
                </div>

                <div v-if="$page.props.jetstream.canManageTwoFactorAuthentication">
                    <two-factor-authentication-form class="mt-10 sm:mt-0"/>

                    <jet-section-border/>
                </div>

                <logout-other-browser-sessions-form :sessions="sessions" class="mt-10 sm:mt-0"/>

                <jet-section-border/>

                <delete-user-form class="mt-10 sm:mt-0"/>
            </div>
        </div>
    </app-layout>
</template>

<script>
import AppLayout from '@/Layouts/AppLayout.vue'
import DeleteUserForm from './DeleteUserForm.vue'
import JetSectionBorder from '@/Jetstream/SectionBorder.vue'
import LogoutOtherBrowserSessionsForm from './LogoutOtherBrowserSessionsForm.vue'
import TwoFactorAuthenticationForm from './TwoFactorAuthenticationForm.vue'
import UpdatePasswordForm from './UpdatePasswordForm.vue'
import UpdateProfileInformationForm from './UpdateProfileInformationForm.vue'
import BreadCrumbs from "@/Components/BreadCrumbs.vue";

export default {
    props: ['sessions'],

    components: {
        BreadCrumbs,
        AppLayout,
        DeleteUserForm,
        JetSectionBorder,
        LogoutOtherBrowserSessionsForm,
        TwoFactorAuthenticationForm,
        UpdatePasswordForm,
        UpdateProfileInformationForm,
    },
    data() {
        return {
            items: [
                {
                    text: 'Dashboard',
                    disabled: false,
                    href: 'dashboard',
                },
                {
                    text: 'Profile',
                    disabled: true,
                    href: 'areas.user.profile',
                }
            ]
        }
    }
}
</script>
