module Constants
  SITE_NAME = if Rails.env.development?
                '[Dev] 幻水総選挙2019'.freeze
              else
                '幻水総選挙2019'.freeze
              end

  STAFFS = [
    { name: 'キネコ', screen_name: 'kineko_27', icon_file: '@kineko_27_icon' },
    { name: '皓月', screen_name: 'k_otare', icon_file: '@k_otare_icon' },
    { name: 'さいり', screen_name: 'mizuhara0127', icon_file: '@mizuhara0127_icon' },
    { name: 'たっきー', screen_name: 'potch_rune', icon_file: '@potch_rune_icon' },
    { name: '田中まさはる', screen_name: '?????', icon_file: '@gomikoro_icon' },
    { name: '若dnt子', screen_name: 'wakadante', icon_file: '@wakadante_icon' },
  ].freeze

  FINAL_PARTICIPANTS_NUMBER_VIA_TWEET = 1749
  FINAL_PARTICIPANTS_NUMBER_VIA_DM    = 158
  FINAL_PARTICIPANTS_NUMBER_VIA_ALL   = FINAL_PARTICIPANTS_NUMBER_VIA_TWEET + FINAL_PARTICIPANTS_NUMBER_VIA_DM

  FINAL_VOTE_NUMBER_VIA_TWEET = 5168
  FINAL_VOTE_NUMBER_VIA_DM    = 474
  FINAL_VOTE_NUMBER_VIA_ALL   = FINAL_VOTE_NUMBER_VIA_TWEET + FINAL_VOTE_NUMBER_VIA_DM

  # 138 tweets
  MISSED_TWEET_IDS_20190609_192500 = [
    1137357334391377920,
    1136992348112531457,
    1136996437974142976,
    1136986768476057600,
    1137357148923416577,
    1136981850692378624,
    1136982902988726272,
    1136994384329633793,
    1136994055802408960,
    1136973751285760001,
    1136978395760214018,
    1136966685481586695,
    1136996396161163264,
    1136968126354952194,
    1136967813384380416,
    1136975666836983808,
    1136994433746923521,
    1136997375690469376,
    1136981326341349376,
    1136996596296560640,
    1136967384693035008,
    1136992518199959558,
    1136991492893945857,
    1136980360678395904,
    1137506715245502470,
    1136977045211078656,
    1136970900639604737,
    1136970578336702465,
    1136967701316886528,
    1136972458890633216,
    1136971709238480897,
    1136972093952651264,
    1136971034010107904,
    1136989188199337984,
    1136999377300418560,
    1136968615687704577,
    1136989587635523585,
    1136981007842783232,
    1136967869072154624,
    1137004776950910984,
    1136990384066686976,
    1136973032142938112,
    1137002299304267777,
    1136990016180146178,
    1136990431701479425,
    1136994358056456193,
    1136993535494721536,
    1137001200086183937,
    1136968424129646592,
    1136972702948835328,
    1136973164402040833,
    1137002758781857797,
    1137006799939235842,
    1136970447122120704,
    1137006920902930432,
    1137004114309574656,
    1136984668136280065,
    1136986039124234243,
    1137004069376077824,
    1136986547561959430,
    1137001192578359297,
    1136974030890659841,
    1136983946892271617,
    1136980373320060928,
    1136985457625976833,
    1136973158647443458,
    1136992415695351808,
    1136974963615813632,
    1136969536719032326,
    1136968002048389122,
    1136968768834289667,
    1136989303521722368,
    1136990290688892928,
    1136978874556805121,
    1136978175081078787,
    1136993307471466496,
    1136966379301613569,
    1136974749651750914,
    1136968973654810624,
    1136988387624120320,
    1136999489170862081,
    1136977864576790533,
    1137003191424303105,
    1137505921662193664,
    1137004847885049856,
    1137357162148052992,
    1137356609250766849,
    1136970820918452224,
    1136969722434428928,
    1136969449674686465,
    1136995413943234560,
    1136971377007742977,
    1136967397800202241,
    1136967561935933440,
    1137003007814455296,
    1137005246834593792,
    1136969226739101696,
    1137374651330359297,
    1137469047904194560,
    1137342515411972096,
    1137470047473954816,
    1137495435843477504,
    1137360141186035713,
    1137371406503632896,
    1137371530139033603,
    1137318764473536512,
    1137364084397989888,
    1137362218146623488,
    1137500955593723904,
    1137495049099309056,
    1137369332961251329,
    1137366014692286464,
    1137503065651605505,
    1137349498252873731,
    1137313181380988928,
    1137379973038166016,
    1137343549983215621,
    1137470845838741504,
    1137375214231121921,
    1137504162365579265,
    1137460185830572032,
    1137489838230331392,
    1137373106467614720,
    1137494906753019905,
    1137376360622485504,
    1137353308241141761,
    1137390872931098624,
    1137388875066699776,
    1137312485529202689,
    1137454608878456832,
    1137346525896384516,
    1137362197519032321,
    1137369518588682240,
    1137502382307270656,
    1137362452276924416,
    1137363930827767808,
    1137371039195811843,
    1137374331250458625,
  ].freeze
  # TargetTweet.find_by(tweet_id: 1137503065651605505).collect_tweet_way_id #=>2
  # TargetTweet.where(collect_tweet_way_id: 2).count #=> 134

  # 138 users
  MISSED_TWEET_USERS_20190609_192500 = %w(
    _Ladygrey713
    0o_sb
    1_Hira33
    23bonjinn23
    37shibainu
    3kannotanetane
    a_chi_ko
    A_SSammy
    acorn_in_eddy
    ag_si_
    akakuro1111
    akari_m_3822
    aki_ura_aki
    aki92104
    aniyu_ave
    ao_no_tami
    aries_mirage
    artcatteries
    arumi_kamikami
    B5A843
    camimai0621
    chimadwnq
    danceofwildcat
    diavolo_bianco
    edtina_love
    en801
    fkmtlove_Hina
    fy_mikan
    g3hugo168
    gumico3
    Hanaedge1984
    harusasameme
    hatigo0805
    hatihathi
    heirinn7
    hikaribaya
    HiroAnachronism
    HiverMessage
    hkusanishi
    ishiduka_mikoto
    iwaka_koke
    izumoyu
    J_in_G
    Jako20_23
    kanade_hnkn
    kei_d0v0b
    kei_laurant
    kisaragi_kai
    kitunelpc
    kogekisata_0209
    looksick
    mayonezusaikyo
    meltyrabbit_k
    midouritsu
    mikecat00
    miyashiro_k
    moderato5241
    nakedflower
    nanatsuno_tsuki
    natsumi_ss
    neige_obst
    nijinama
    nonamefailing
    o0sakupam0o
    option_kosyaku
    OZT96076464
    pinmari
    pod0rtshbo
    pogeiroha
    povuna
    RagiJun
    Ren_005th
    riddele
    rokou_mitsuya
    Rur_asnaro2
    saku_sa1512
    sakumacompany
    segra1
    seitona
    sera_heavenly
    SHAKI2P
    somi336
    sumi_tora
    syomin9999
    tadanotama
    tasukuroneko
    tealbluerabbit
    teradalaurant
    towa_asayoshi
    tsukitamiko
    udonday894
    umiko1101
    uririn_kozulove
    yama_shin34
    yue_koba3
    yuiyui0821
    yunonogi
    5121dkss
    AP4wz
    awaji_turezure
    cawaro
    e_ororonz
    givememineral
    gretch0218
    haiao_069
    hakusai1109
    hallsosaku
    hanabusaa44
    houko3
    I4osrmm
    inaho_5
    kaiwareoisii
    kanmi_yoiko
    kaza0k
    kickoffjun
    leczard
    mizukisakuya
    mltplus
    moco_muyooou
    mothitukiusa
    namiHEY_eaka
    nanayasann_oekk
    RenRenRenRing
    Replicasound
    ruine609
    ruiru2240
    rumble20135
    sakiri_y
    sakura0303night
    sawamr
    segretario_
    shiharu0802
    signe201809
    snoopdeer
    soh_na
    yoshi_ha
    yuruyurubo
    yuzupi0609
  ).freeze

  # 153 tweets
  MISSED_TWEET_IDS_20190610_033100 = [
    1137154096828313600,
    1137296331653804033,
    1136992348112531457,
    1136986768476057600,
    1136981850692378624,
    1136982902988726272,
    1136994384329633793,
    1136994055802408960,
    1136973751285760001,
    1136978395760214018,
    1136966685481586695,
    1136996396161163264,
    1136968126354952194,
    1137159739756834816,
    1136967813384380416,
    1136975666836983808,
    1137031061769076737,
    1136994433746923521,
    1137170434036785152,
    1136997375690469376,
    1136981326341349376,
    1136996596296560640,
    1137180900481875969,
    1136967384693035008,
    1137118197365108736,
    1137007359446753283,
    1137198369682550788,
    1136992518199959558,
    1137152094538948608,
    1137011891115454465,
    1137018500373860352,
    1136991492893945857,
    1137018330361917440,
    1136980360678395904,
    1137165083362988032,
    1136977045211078656,
    1136970900639604737,
    1137212159513976833,
    1136970578336702465,
    1136967701316886528,
    1137021382351417344,
    1137220639096418305,
    1136972458890633216,
    1137007280468062209,
    1136971709238480897,
    1137154531395919873,
    1136972093952651264,
    1136971034010107904,
    1136989188199337984,
    1136999377300418560,
    1136968615687704577,
    1136989587635523585,
    1136981007842783232,
    1136967869072154624,
    1137204278127316992,
    1137004776950910984,
    1137191124273995776,
    1136990384066686976,
    1136973032142938112,
    1137002299304267777,
    1136990016180146178,
    1137278766135226368,
    1136990431701479425,
    1137047937886801921,
    1137011916604203008,
    1137022476595019776,
    1136993535494721536,
    1137008982956969984,
    1137032293430677504,
    1137001200086183937,
    1137227546343268352,
    1137167802916192256,
    1136968424129646592,
    1137212482949267456,
    1136972702948835328,
    1137012011886190592,
    1137055832430895105,
    1136973164402040833,
    1137202846464528385,
    1137121042302767104,
    1137204082186174466,
    1137120273042272256,
    1137143542575316993,
    1137002758781857797,
    1137006799939235842,
    1137008175335346176,
    1136970447122120704,
    1137006920902930432,
    1137183684757528577,
    1137100530491174917,
    1136989601363402752,
    1137004114309574656,
    1137035456317538305,
    1136986039124234243,
    1137004069376077824,
    1137011459798388737,
    1137032114543579137,
    1136986547561959430,
    1137001192578359297,
    1137017257282793472,
    1136974030890659841,
    1137277174245781504,
    1136984447830568961,
    1136983946892271617,
    1136980373320060928,
    1136985457625976833,
    1136973158647443458,
    1136992415695351808,
    1136974963615813632,
    1136969536719032326,
    1136969347920830464,
    1136968002048389122,
    1137212105243762689,
    1136968768834289667,
    1136989303521722368,
    1136990290688892928,
    1136978874556805121,
    1137016594863874050,
    1137182444078096384,
    1136978175081078787,
    1136993307471466496,
    1136966379301613569,
    1136974749651750914,
    1136968973654810624,
    1137143273347149824,
    1136999489170862081,
    1137275487980380160,
    1137269175854854144,
    1137220632154783749,
    1137208118172012544,
    1137190171323932673,
    1137008496715608064,
    1136977864576790533,
    1137003191424303105,
    1137025566761111552,
    1137206563389632512,
    1137104152293568512,
    1137004847885049856,
    1136970820918452224,
    1137007031095664646,
    1137307522237231104,
    1136969722434428928,
    1136969449674686465,
    1136995413943234560,
    1136971377007742977,
    1136967397800202241,
    1137073538106441729,
    1136967561935933440,
    1137047844077035520,
    1136969333509316610,
    1137003007814455296,
    1137005246834593792,
    1136969226739101696,
  ].freeze

  # 153 users
  MISSED_TWEET_USERS_20190610_033100 = %w(
    _amane_0
    0505monu
    0o_sb
    23bonjinn23
    3kannotanetane
    a_chi_ko
    A_SSammy
    acorn_in_eddy
    ag_si_
    akakuro1111
    akari_m_3822
    aki_ura_aki
    aki92104
    an_pon_tan1000
    aniyu_ave
    ao_no_tami
    ares1227eru
    aries_mirage
    ArosElric
    artcatteries
    arumi_kamikami
    B5A843
    blueeeee_aoi
    camimai0621
    canary_secret
    cbcocon
    cFVmrE0C3HUReZQ
    chimadwnq
    choco1125U
    cocoro_no_hana
    comatuna96
    danceofwildcat
    denebu00
    diavolo_bianco
    eKAZU
    en801
    fkmtlove_Hina
    FUWA_k
    fy_mikan
    g3hugo168
    gbmc7284111
    gimmix_
    gumico3
    halich
    Hanaedge1984
    Harry_kbs
    harusasameme
    hatigo0805
    hatihathi
    heirinn7
    hikaribaya
    HiroAnachronism
    HiverMessage
    hkusanishi
    hokashibori
    ishiduka_mikoto
    iunius30
    iwaka_koke
    izumoyu
    J_in_G
    Jako20_23
    jankenmaketa
    kanade_hnkn
    kanan_ao
    kanotooo
    KARIKO
    kei_laurant
    kiri_dsP
    kiriha_5626
    kisaragi_kai
    kisyou333
    kitomix
    kitunelpc
    knitsocks
    kogekisata_0209
    kohya_n_o
    kyllump
    looksick
    Luhuna
    mamamaya_
    mamemaru001
    marian50en
    Mash_334
    mayonezusaikyo
    meltyrabbit_k
    mi_suikyou
    midouritsu
    mikecat00
    mint_julippe
    misamameko
    miyanon_99
    miyashiro_k
    motwfr
    nakedflower
    nanatsuno_tsuki
    nao_aot_o
    nash_p_
    natsumi_ss
    neige_obst
    niji_ribbon86
    nijinama
    nishinihon74
    Nmfs69love
    nonamefailing
    o0sakupam0o
    option_kosyaku
    OZT96076464
    pinmari
    pod0rtshbo
    pogeiroha
    popo_nta
    povuna
    pxv_ja
    RagiJun
    Ren_005th
    riddele
    rokou_mitsuya
    rui_matq_1152
    ruk138
    Rur_asnaro2
    saku_sa1512
    sakumacompany
    segra1
    seitona
    serena_nepuPP
    SHAKI2P
    shiba48_hy
    shien_tomato
    sinamondai
    siyarion
    snowbird_0303
    sodapop_of_aug
    somi336
    sumi_tora
    suzucotter
    syu_go_nino
    syufu_shirogane
    tadanotama
    teradalaurant
    Thikoz
    tomoya59aoyama
    towa_asayoshi
    tsukitamiko
    udonday894
    umiko1101
    uririn_kozulove
    y2etc_matsu
    yama_shin34
    yomo_ta
    yu3100
    yue_koba3
    yuiyui0821
    yunonogi
  ).freeze

  # 204 tweets
  MERGED_MISSED_TWEET_IDS = (MISSED_TWEET_IDS_20190609_192500 + MISSED_TWEET_IDS_20190610_033100).uniq

  # 204 users
  MERGED_MISSED_TWEET_USERS = (MISSED_TWEET_USERS_20190609_192500 + MISSED_TWEET_USERS_20190610_033100).uniq

  # 166 tweets
  GENSUI_OSHI_SERIFU_TWEET_IDS = %w(
    1123950343002447877
    1123951453243097088
    1123952973036621824
    1123954406326775818
    1123956147843739648
    1123957297988939779
    1123964225221799944
    1123964536011272195
    1123966428745555968
    1124018984020578311
    1124106601911214080
    1124157353312436224
    1124179330479693825
    1124212077910880256
    1124252993979707392
    1124256321170132992
    1124294217772064768
    1124294463713472515
    1124297884206108672
    1124299084070674432
    1124307006867722240
    1124310826117001219
    1124331442085945346
    1124681143112966144
    1124694673837006848
    1124881922977480704
    1124888890618273792
    1124889226128969728
    1124917622930206725
    1125034197150646272
    1125035746451185664
    1125042193498923008
    1125221848269017088
    1125225569572966403
    1125630266595135488
    1125755677249458178
    1125769815140945921
    1125770178975813633
    1125849969414377472
    1125890964600393728
    1125952744232120320
    1126101129371144192
    1126108115261218818
    1126111854781026308
    1126130353582698496
    1126133632567955456
    1126135703547461632
    1126140362337112065
    1126229416688766981
    1126231104673894401
    1126252847572537344
    1126267676404281344
    1126270334376636416
    1126289969222262784
    1126393566840778752
    1126399573759410176
    1126403154499624960
    1126431428286115840
    1126473030455005185
    1126484252030226433
    1126522185101635586
    1126617802884898818
    1126842678799360001
    1126843794291191808
    1126845296539947009
    1126846370290122752
    1126853230799884288
    1126853271627284480
    1126854885339566080
    1126866491905699841
    1126869572009644032
    1126953191629832195
    1126953879596404736
    1126961197272711173
    1127031493119827969
    1127035000791027713
    1127047883922874372
    1127058122332262400
    1127063870265221125
    1127074230133092354
    1127094285419941888
    1127094488143286273
    1127095375406321664
    1127104780285800448
    1127125428349489154
    1127131758883827712
    1127132500403163137
    1127151337647403008
    1127159741782810625
    1127165701188231168
    1127167100848459776
    1127178119004037121
    1127182462512128000
    1127184125780156416
    1127184894264635392
    1127186156116791297
    1127188989813743616
    1127189319376969729
    1127190051866046464
    1127190414971232256
    1127191157090316289
    1127192169226194945
    1127192557354606592
    1127194328948809734
    1127194765341220864
    1127194831640334336
    1127194949294759937
    1127195554851614720
    1127196262783012865
    1127196345763151872
    1127196730825404417
    1127196952762900482
    1127197113098461184
    1127197130961981440
    1127197424433254400
    1127199662979502080
    1127199824850219008
    1127200136923189248
    1127200313625022467
    1127200904841613313
    1127202965935157248
    1127202977347801088
    1127203985452982272
    1127204795905744896
    1127204821700714496
    1127205814895136768
    1127206009934495746
    1127206308212461568
    1127207514733367296
    1127209110422708228
    1127209414291623938
    1127209879544844288
    1127209936453132288
    1127210662319411200
    1127215970307600385
    1127217171170381826
    1127218993088028676
    1127219122692022272
    1127219846695886848
    1127220176829575169
    1127220570368561154
    1127220649926070272
    1127221544336351234
    1127222927244443648
    1127223124930416640
    1127223288550158336
    1127224581876355072
    1127224739372552192
    1127225489800581120
    1127225967376658434
    1127226220796452864
    1127226440708005888
    1127229059102986240
    1127229146407374848
    1127229427153133570
    1127229722843205632
    1127240605153710080
    1127250592164794369
    1127254320724865025
    1127550898056511489
    1134091161772089346
    1136930506921005056
    1136932990376824832
    1136969315985502208
    1137031045629394945
    1137180575897309185
  ).freeze

  # 3 tweets
  APPENDED_GENSUI_OSHI_SERIFU_TWEET_IDS = %w(
    1126958046117269504
    1127062084166963201
    1127185578808635392
  ).freeze

  MERGED_GENSUI_OSHI_SERIFU_TWEET_IDS = (GENSUI_OSHI_SERIFU_TWEET_IDS + APPENDED_GENSUI_OSHI_SERIFU_TWEET_IDS).uniq
end

