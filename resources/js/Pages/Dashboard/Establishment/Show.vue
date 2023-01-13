<template>
    <app-layout>
        <bread-crumbs
            name="Visualización de establecimiento"
            :items="items"
        ></bread-crumbs>

        <v-container>
            <v-card class="px-6 py-4">
                <v-container class="container">
                    <div class="d-flex flex-wrap justify-space-between">
                        <div class="flex-1">
                            <div class="d-flex align-start justify-space-between">
                                <div class="mb-3">
                                    <h5 class="mr-2 mb-0 text-h6 text-uppercase">
                                        {{ data.name }}
                                    </h5>

                                    <p class="text--disabled mb-0">
                                        Numero NIT: {{ data.nit }}
                                    </p>
                                    <div class="d-flex">
                                        <div class="text--disabled mb-0">
                                            Municipio de {{ data.municipality }} &nbsp;
                                        </div>
                                        <div class="text--disabled mb-0">
                                            Departamento de {{ data.department }}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="flex-1 text-right">
                            <v-btn fab x-small
                                   class="mr-2">
                                <v-icon>
                                    mdi-email-outline
                                </v-icon>
                            </v-btn>

                            <v-btn fab x-small>
                                <v-icon>
                                    mdi-dots-horizontal
                                </v-icon>
                            </v-btn>
                        </div>
                    </div>
                </v-container>
            </v-card>
        </v-container>

        <!--
                <div class="row">
                    <div class="col-lg-8 col-12">
                        <div class="card-shadow border-radius-xl v-card v-sheet theme&#45;&#45;light">
                            <div class="border-bottom d-flex align-center px-4 py-4">
                                <div class="d-flex align-center"><a href="javascript:;" class="text-decoration-none">
                                    <div class="v-avatar rounded" style="height: 48px; min-width: 48px; width: 48px;">
                                        <div aria-label="profile-image" role="img" class="v-image v-responsive theme&#45;&#45;light">
                                            <div class="v-responsive__sizer" style="padding-bottom: 100%;"></div>
                                            <div class="v-image__image v-image__image&#45;&#45;cover"
                                                 style="background-image: url(&quot;https://demos.creative-tim.com/vuetify-soft-ui-dashboard-pro-marketplace/img/team-4.897617b8.jpg&quot;); background-position: center center;"></div>
                                            <div class="v-responsive__content" style="width: 800px;"></div>
                                        </div>
                                    </div>
                                </a>
                                    <div class="mx-4"><a href="javascript:;"
                                                         class="text-dark font-weight-600 text-sm text-decoration-none">John
                                        Snow</a><small class="d-block text-muted">3 days ago</small></div>
                                </div>
                                <div class="text-end ms-auto">
                                    <button type="button"
                                            class="font-weight-bolder bg-gradient-primary py-4 px-7 v-btn v-btn&#45;&#45;outlined theme&#45;&#45;light v-size&#45;&#45;small"
                                            style="color: rgb(255, 255, 255); caret-color: rgb(255, 255, 255);"><span
                                        class="v-btn__content"><i aria-hidden="true"
                                                                  class="v-icon notranslate fas fa-plus pe-2 theme&#45;&#45;light"
                                                                  style="font-size: 8px;"></i> Follow </span></button>
                                </div>
                            </div>
                            <div class="px-4 py-4"><p class="mb-6 text-body"> Personal profiles are the perfect way for you to
                                grab their attention and persuade recruiters to continue reading your CV because you’re telling
                                them from the off exactly why they should hire you. </p>
                                <div class="v-image v-responsive border-radius-lg shadow-lg theme&#45;&#45;light">
                                    <div class="v-responsive__sizer" style="padding-bottom: 66.6667%;"></div>
                                    <div class="v-image__image v-image__image&#45;&#45;cover"
                                         style="background-image: url(&quot;https://images.unsplash.com/photo-1552581234-26160f608093?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=2100&amp;q=80&quot;); background-position: center center;"></div>
                                    <div class="v-responsive__content" style="width: 2100px;"></div>
                                </div>
                                <div class="row align-center px-2 mt-6 mb-2">
                                    <div class="col-sm-6 col">
                                        <div class="d-flex">
                                            <div class="d-flex align-center"><i aria-hidden="true"
                                                                                class="v-icon notranslate ni ni ni ni-like-2 me-1 text-body cursor-pointer theme&#45;&#45;light"
                                                                                style="font-size: 16px;"></i><span
                                                class="text-sm text-body me-4">150</span></div>
                                            <div class="d-flex align-center"><i aria-hidden="true"
                                                                                class="v-icon notranslate ni ni ni ni-chat-round me-1 text-body cursor-pointer theme&#45;&#45;light"
                                                                                style="font-size: 16px;"></i><span
                                                class="text-sm text-body me-4">36</span></div>
                                            <div class="d-flex align-center"><i aria-hidden="true"
                                                                                class="v-icon notranslate ni ni ni ni-curved-next me-1 text-body cursor-pointer theme&#45;&#45;light"
                                                                                style="font-size: 16px;"></i><span
                                                class="text-sm text-body me-4">12</span></div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col">
                                        <div class="d-flex align-center">
                                            <div class="d-flex align-items-center ms-auto">
                                                <div class="v-avatar border border-white ms-n2"
                                                     style="height: 24px; min-width: 24px; width: 24px;"><img
                                                    src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-5.56332143.jpg"
                                                    alt="Avatar"></div>
                                                <div class="v-avatar border border-white ms-n2"
                                                     style="height: 24px; min-width: 24px; width: 24px;"><img
                                                    src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-2.de26a134.jpg"
                                                    alt="Avatar"></div>
                                                <div class="v-avatar border border-white ms-n2"
                                                     style="height: 24px; min-width: 24px; width: 24px;"><img
                                                    src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-1.66f62826.jpg"
                                                    alt="Avatar"></div>
                                            </div>
                                            <small class="ps-2 font-weight-bold text-body">and 30+ more</small></div>
                                    </div>
                                </div>
                                <div class="mb-1">
                                    <hr class="horizontal dark mt-1 mb-5">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0">
                                            <div class="v-avatar" style="height: 48px; min-width: 48px; width: 48px;">
                                                <div class="v-image v-responsive theme&#45;&#45;light">
                                                    <div class="v-responsive__sizer" style="padding-bottom: 100%;"></div>
                                                    <div class="v-image__image v-image__image&#45;&#45;cover"
                                                         style="background-image: url(&quot;https://demos.creative-tim.com/vuetify-soft-ui-dashboard-pro-marketplace/img/bruce-mars.c0421fd9.jpg&quot;); background-position: center center;"></div>
                                                    <div class="v-responsive__content" style="width: 800px;"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="flex-grow-1 ms-4"><h5 class="text-h5 text-typo font-weight-bold mt-0 mb-2">
                                            Michael Lewis </h5>
                                            <p class="text-sm text-body"> I always felt like I could do anything. That’s the
                                                main thing people are controlled by! Thoughts- their perception of
                                                themselves! </p>
                                            <div class="d-flex align-center"><i aria-hidden="true"
                                                                                class="v-icon notranslate ni ni ni ni-like-2 me-1 mt-0 cursor-pointer text-body theme&#45;&#45;light"
                                                                                style="font-size: 16px;"></i><span
                                                class="text-sm me-2 text-body">3 likes</span><i aria-hidden="true"
                                                                                                class="v-icon notranslate ni ni ni ni-curved-next me-1 mt-0 cursor-pointer text-body theme&#45;&#45;light"
                                                                                                style="font-size: 16px;"></i><span
                                                class="text-sm me-2 text-body">2 shares</span></div>
                                        </div>
                                    </div>
                                    <div class="d-flex mt-5">
                                        <div class="flex-shrink-0">
                                            <div class="v-avatar" style="height: 48px; min-width: 48px; width: 48px;">
                                                <div class="v-image v-responsive theme&#45;&#45;light">
                                                    <div class="v-image__image v-image__image&#45;&#45;preload v-image__image&#45;&#45;cover"
                                                         style="background-position: center center;"></div>
                                                    <div class="v-responsive__content"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="flex-grow-1 ms-4"><h5 class="text-h5 text-typo font-weight-bold mt-0 mb-2">
                                            Jessica Stones </h5>
                                            <p class="text-sm text-body"> Society has put up so many boundaries, so many
                                                limitations on what’s right and wrong that it’s almost impossible to get a pure
                                                thought out. It’s like a little kid, a little boy. </p>
                                            <div class="d-flex align-center"><i aria-hidden="true"
                                                                                class="v-icon notranslate ni ni ni ni-like-2 me-1 mt-0 cursor-pointer text-body theme&#45;&#45;light"
                                                                                style="font-size: 16px;"></i><span
                                                class="text-sm me-2 text-body">10 likes</span><i aria-hidden="true"
                                                                                                 class="v-icon notranslate ni ni ni ni-curved-next me-1 mt-0 cursor-pointer text-body theme&#45;&#45;light"
                                                                                                 style="font-size: 16px;"></i><span
                                                class="text-sm me-2 text-body">1 share</span></div>
                                        </div>
                                    </div>
                                    <div class="d-flex mt-6">
                                        <div class="flex-shrink-0">
                                            <div class="v-avatar" style="height: 48px; min-width: 48px; width: 48px;">
                                                <div class="v-image v-responsive theme&#45;&#45;light">
                                                    <div class="v-image__image v-image__image&#45;&#45;preload v-image__image&#45;&#45;cover"
                                                         style="background-position: center center;"></div>
                                                    <div class="v-responsive__content"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="flex-grow-1 ms-4">
                                            <div
                                                class="v-input border theme&#45;&#45;light v-text-field v-text-field&#45;&#45;is-booted v-text-field&#45;&#45;enclosed v-text-field&#45;&#45;outlined v-text-field&#45;&#45;placeholder">
                                                <div class="v-input__control">
                                                    <div class="v-input__slot">
                                                        <fieldset aria-hidden="true">
                                                            <legend style="width: 0px;"><span class="notranslate">​</span>
                                                            </legend>
                                                        </fieldset>
                                                        <div class="v-text-field__slot"><input id="input-4647"
                                                                                               placeholder="Write your comment"
                                                                                               type="text"></div>
                                                    </div>
                                                    <div class="v-text-field__details">
                                                        <div class="v-messages theme&#45;&#45;light">
                                                            <div class="v-messages__wrapper"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-12">
                        <div class="card-shadow border-radius-xl mb-6 v-card v-sheet theme&#45;&#45;light">
                            <div class="px-4 py-4">
                                <div class="row align-center">
                                    <div class="col col-9"><h5 class="
                          text-h5
                          font-weight-bold
                          mb-1
                          text-gradient text-primary
                        "><a href="javascript:;" class="text-decoration-none">Digital Marketing</a></h5></div>
                                    <div class="text-end col col-3">
                                        <button type="button"
                                                class="text-secondary v-btn v-btn&#45;&#45;icon v-btn&#45;&#45;round theme&#45;&#45;light v-size&#45;&#45;small"
                                                role="button" aria-haspopup="true" aria-expanded="false"><span
                                            class="v-btn__content"><i aria-hidden="true"
                                                                      class="v-icon notranslate fas fa-ellipsis-v theme&#45;&#45;light"
                                                                      style="font-size: 16px;"></i></span></button>
                                        <div class="v-menu">&lt;!&ndash;&ndash;&gt;</div>
                                    </div>
                                </div>
                                <p class="text-body mt-3">A group of people who collectively are responsible for all of the work
                                    necessary to produce working, validated assets.</p>
                                <div class="d-flex"><p class="mb-0 text-body">Industry:</p>
                                    <button type="button" class="
                        border-radius-md
                        font-weight-bolder
                        px-3
                        py-3
                        badge-font-size
                        ms-auto
                        text-body
                       v-btn v-btn&#45;&#45;has-bg theme&#45;&#45;light elevation-0 v-size&#45;&#45;small"
                                            style="height: 21px; background-color: rgb(228, 232, 237); border-color: rgb(228, 232, 237);">
                                        <span class="v-btn__content">Martketing Team</span></button>
                                </div>
                                <hr class="horizontal dark my-4">
                                <div class="d-flex"><p class="mb-0 text-body">Rating:</p>
                                    <div class="rating ms-auto"><i aria-hidden="true"
                                                                   class="v-icon notranslate fas fa-star text-body theme&#45;&#45;light"
                                                                   style="font-size: 16px;"></i><i aria-hidden="true"
                                                                                                   class="v-icon notranslate fas fa-star text-body ms-1 theme&#45;&#45;light"
                                                                                                   style="font-size: 16px;"></i><i
                                        aria-hidden="true" class="v-icon notranslate fas fa-star text-body ms-1 theme&#45;&#45;light"
                                        style="font-size: 16px;"></i><i aria-hidden="true"
                                                                        class="v-icon notranslate fas fa-star text-body ms-1 theme&#45;&#45;light"
                                                                        style="font-size: 16px;"></i><i aria-hidden="true"
                                                                                                        class="v-icon notranslate fas fa-star-half-alt text-body ms-1 theme&#45;&#45;light"
                                                                                                        style="font-size: 16px;"></i>
                                        &lt;!&ndash;&ndash;&gt;</div>
                                </div>
                                <hr class="horizontal dark my-4">
                                <div class="d-flex"><p class="mb-0 text-body">Members:</p><span
                                    class="avatar-group d-flex ms-auto"><div class="v-avatar border border-white ms-n3"
                                                                             aria-haspopup="true" aria-expanded="false"
                                                                             style="height: 24px; min-width: 24px; width: 24px;"><img
                                    src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-1.66f62826.jpg" alt="Avatar"></div><span
                                    class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><span class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                    class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                    style="height: 24px; min-width: 24px; width: 24px;"><img
                                    src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-2.de26a134.jpg" alt="Avatar"></div><span
                                    class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                    class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                    style="height: 24px; min-width: 24px; width: 24px;"><img
                                    src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-3.08ced048.jpg" alt="Avatar"></div><span
                                    class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                    class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                    style="height: 24px; min-width: 24px; width: 24px;"><img
                                    src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-4.897617b8.jpg" alt="Avatar"></div></span>
                                </div>
                            </div>
                        </div>
                        <div class="card-shadow border-radius-xl mb-6 v-card v-sheet theme&#45;&#45;light">
                            <div class="px-4 py-4">
                                <div class="row align-center">
                                    <div class="col col-9"><h5 class="
                          text-h5
                          font-weight-bold
                          mb-1
                          text-gradient text-primary
                        "><a href="javascript:;" class="text-decoration-none">Design</a></h5></div>
                                    <div class="text-end col col-3">
                                        <button type="button"
                                                class="text-secondary v-btn v-btn&#45;&#45;icon v-btn&#45;&#45;round theme&#45;&#45;light v-size&#45;&#45;small"
                                                role="button" aria-haspopup="true" aria-expanded="false"><span
                                            class="v-btn__content"><i aria-hidden="true"
                                                                      class="v-icon notranslate fas fa-ellipsis-v theme&#45;&#45;light"
                                                                      style="font-size: 16px;"></i></span></button>
                                        <div class="v-menu">&lt;!&ndash;&ndash;&gt;</div>
                                    </div>
                                </div>
                                <p class="text-body mt-3">Because it's about motivating the doers. Because I’m here to follow my
                                    dreams and inspire other people to follow their dreams, too.</p>
                                <div class="d-flex"><p class="mb-0 text-body">Industry:</p>
                                    <button type="button" class="
                        border-radius-md
                        font-weight-bolder
                        px-3
                        py-3
                        badge-font-size
                        ms-auto
                        text-body
                       v-btn v-btn&#45;&#45;has-bg theme&#45;&#45;light elevation-0 v-size&#45;&#45;small"
                                            style="height: 21px; background-color: rgb(228, 232, 237); border-color: rgb(228, 232, 237);">
                                        <span class="v-btn__content">Design Team</span></button>
                                </div>
                                <hr class="horizontal dark my-4">
                                <div class="d-flex"><p class="mb-0 text-body">Rating:</p>
                                    <div class="rating ms-auto"><i aria-hidden="true"
                                                                   class="v-icon notranslate fas fa-star text-body theme&#45;&#45;light"
                                                                   style="font-size: 16px;"></i><i aria-hidden="true"
                                                                                                   class="v-icon notranslate fas fa-star text-body ms-1 theme&#45;&#45;light"
                                                                                                   style="font-size: 16px;"></i><i
                                        aria-hidden="true" class="v-icon notranslate fas fa-star text-body ms-1 theme&#45;&#45;light"
                                        style="font-size: 16px;"></i><i aria-hidden="true"
                                                                        class="v-icon notranslate fas fa-star text-body ms-1 theme&#45;&#45;light"
                                                                        style="font-size: 16px;"></i>&lt;!&ndash;&ndash;&gt;<i
                                        aria-hidden="true" class="v-icon notranslate fas fa-star text-body ms-1 theme&#45;&#45;light"
                                        style="font-size: 16px;"></i></div>
                                </div>
                                <hr class="horizontal dark my-4">
                                <div class="d-flex"><p class="mb-0 text-body">Members:</p><span
                                    class="avatar-group d-flex ms-auto"><div class="v-avatar border border-white ms-n3"
                                                                             aria-haspopup="true" aria-expanded="false"
                                                                             style="height: 24px; min-width: 24px; width: 24px;"><img
                                    src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-4.897617b8.jpg" alt="Avatar"></div><span
                                    class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><span class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                    class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                    style="height: 24px; min-width: 24px; width: 24px;"><img
                                    src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-3.08ced048.jpg" alt="Avatar"></div><span
                                    class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                    class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                    style="height: 24px; min-width: 24px; width: 24px;"><img
                                    src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-1.66f62826.jpg" alt="Avatar"></div><span
                                    class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                    class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                    style="height: 24px; min-width: 24px; width: 24px;"><img
                                    src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-2.de26a134.jpg" alt="Avatar"></div></span>
                                </div>
                            </div>
                        </div>
                        <div class="card-shadow border-radius-xl mb-6 v-card v-sheet theme&#45;&#45;light">
                            <div class="px-4 py-4">
                                <div class="d-flex">
                                    <div class="v-avatar" style="height: 48px; min-width: 48px; width: 48px;">
                                        <div class="v-image v-responsive theme&#45;&#45;light">
                                            <div class="v-image__image v-image__image&#45;&#45;preload v-image__image&#45;&#45;cover"
                                                 style="background-position: center center;"></div>
                                            <div class="v-responsive__content"></div>
                                        </div>
                                    </div>
                                    <div class="ms-2 my-auto"><h6 class="mb-0 text-h6 text-typo font-weight-bold"> Slack
                                        Meet </h6>
                                        <p class="text-xs mb-0 text-body">11:00 AM</p></div>
                                </div>
                                <p class="text-body mt-3">You have an upcoming meet for Marketing Planning</p>
                                <div class="d-flex"><p class="mb-0 text-body"><b>Meeting ID</b>: 902-128-281</p></div>
                                <hr class="horizontal dark my-4">
                                <div class="d-flex">
                                    <button type="button" class="
                        font-weight-bolder
                        btn-success
                        bg-gradient-success
                        py-4
                        px-8
                       v-btn v-btn&#45;&#45;has-bg theme&#45;&#45;light elevation-0 v-size&#45;&#45;small"
                                            style="background-color: rgb(203, 12, 159); border-color: rgb(203, 12, 159);"><span
                                        class="v-btn__content"> Join </span></button>
                                    <span class="avatar-group d-flex ms-auto"><div class="v-avatar border border-white ms-n3"
                                                                                   aria-haspopup="true" aria-expanded="false"
                                                                                   style="height: 24px; min-width: 24px; width: 24px;"><img
                                        src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-1.66f62826.jpg"
                                        alt="Avatar"></div><span class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><span
                                        class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                        class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                        style="height: 24px; min-width: 24px; width: 24px;"><img
                                        src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-2.de26a134.jpg"
                                        alt="Avatar"></div><span class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                        class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                        style="height: 24px; min-width: 24px; width: 24px;"><img
                                        src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-3.08ced048.jpg"
                                        alt="Avatar"></div><span class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                        class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                        style="height: 24px; min-width: 24px; width: 24px;"><img
                                        src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-4.897617b8.jpg"
                                        alt="Avatar"></div></span></div>
                            </div>
                        </div>
                        <div class="card-shadow border-radius-xl mb-6 v-card v-sheet theme&#45;&#45;light">
                            <div class="px-4 py-4">
                                <div class="d-flex">
                                    <div class="v-avatar" style="height: 48px; min-width: 48px; width: 48px;">
                                        <div class="v-image v-responsive theme&#45;&#45;light">
                                            <div class="v-image__image v-image__image&#45;&#45;preload v-image__image&#45;&#45;cover"
                                                 style="background-position: center center;"></div>
                                            <div class="v-responsive__content"></div>
                                        </div>
                                    </div>
                                    <div class="ms-2 my-auto"><h6 class="mb-0 text-h6 text-typo font-weight-bold">
                                        Invision </h6>
                                        <p class="text-xs mb-0 text-body">4:50 PM</p></div>
                                </div>
                                <p class="text-body mt-3">You have an upcoming video call for Soft Design at 5:00 PM.</p>
                                <div class="d-flex"><p class="mb-0 text-body"><b>Meeting ID</b>: 111-968-981</p></div>
                                <hr class="horizontal dark my-4">
                                <div class="d-flex">
                                    <button type="button" class="
                        font-weight-bolder
                        btn-success
                        bg-gradient-success
                        py-4
                        px-8
                       v-btn v-btn&#45;&#45;has-bg theme&#45;&#45;light elevation-0 v-size&#45;&#45;small"
                                            style="background-color: rgb(203, 12, 159); border-color: rgb(203, 12, 159);"><span
                                        class="v-btn__content"> Join </span></button>
                                    <span class="avatar-group d-flex ms-auto"><div class="v-avatar border border-white ms-n3"
                                                                                   aria-haspopup="true" aria-expanded="false"
                                                                                   style="height: 24px; min-width: 24px; width: 24px;"><img
                                        src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-3.08ced048.jpg"
                                        alt="Avatar"></div><span class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><span
                                        class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                        class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                        style="height: 24px; min-width: 24px; width: 24px;"><img
                                        src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-1.66f62826.jpg"
                                        alt="Avatar"></div><span class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                        class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                        style="height: 24px; min-width: 24px; width: 24px;"><img
                                        src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-2.de26a134.jpg"
                                        alt="Avatar"></div><span class="v-tooltip v-tooltip&#45;&#45;bottom">&lt;!&ndash;&ndash;&gt;</span><div
                                        class="v-avatar border border-white ms-n3" aria-haspopup="true" aria-expanded="false"
                                        style="height: 24px; min-width: 24px; width: 24px;"><img
                                        src="/vuetify-soft-ui-dashboard-pro-marketplace/img/team-4.897617b8.jpg"
                                        alt="Avatar"></div></span></div>
                            </div>
                        </div>
                    </div>
                </div>
        -->

        <v-container>
            <v-row>
                <v-col
                    cols="12"
                    sm="4"
                >
                    <v-card
                        class="mx-auto"
                        max-width="344"
                    >
                        <v-card-text>
                            <div>Establecimiento</div>
                            <p class="text-h5 text--primary">
                                {{ data.name }}
                            </p>
                            <p>Localización</p>
                            <div class="text--primary">
                                Municipio de {{ data.municipality }}<br>
                                Departamento de {{
                                    data.department
                                }}
                            </div>
                        </v-card-text>
                    </v-card>
                </v-col>

                <v-col
                    cols="12"
                    sm="8"
                >

                    <v-sheet
                        min-height="70vh"
                        rounded="lg"
                    >
                        <v-row class="ma-0">
                            <v-col>
                                <v-row class=" no-gutters">
                                    <div class="d-flex justify-space-between justify-md-start col-md-6 col-12">
                                        <inertia-link :href="route('establishment.create')">
                                            <v-btn
                                                class="mr-3 success">
                                                <v-icon class="notranslate mr-2">
                                                    mdi-plus
                                                </v-icon>
                                                Add
                                            </v-btn>
                                        </inertia-link>
                                        <v-btn outlined
                                               class="button-shadow primary--text">
                                            <v-icon aria-hidden="true"
                                                    class="notranslate mr-2">
                                                mdi-filter-variant
                                            </v-icon>
                                            Filters
                                        </v-btn>
                                    </div>
                                    <v-spacer></v-spacer>

                                    <div style="max-width: 250px;" class="mx-auto mt-4 mt-md-0">
                                        <v-text-field hide-details dense enclosed outlined
                                                      append-icon="mdi-magnify"
                                                      placeholder="search"
                                                      v-model="search"
                                        ></v-text-field>
                                    </div>
                                </v-row>
                            </v-col>
                        </v-row>
                    </v-sheet>
                </v-col>
            </v-row>
        </v-container>

    </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout.vue";
import BreadCrumbs from "@/Components/BreadCrumbs.vue";


export default {
    name: "Show",
    components: {
        AppLayout,
        BreadCrumbs
    },
    props: ['data', 'errors'],
    data: () => ({
        search: '',
        items: [
            {
                text: 'Dashboard',
                disabled: false,
                href: '/dashboard'
            },
            {
                text: 'Establecimientos',
                disabled: false,
                href: '/dashboard/establishment'
            },
            {
                text: 'Visualizar',
                disabled: true,
                href: '#'
            },
        ],
    })


}
</script>

<style scoped>

</style>
