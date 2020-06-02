
import Foundation


class Get_Site_SettingModel {
  
    
    // MARK: - Welcome
    struct Site_Setting_SuccessModel: Codable {
        let apiStatus: Int?
        let config: Config?
        
        enum CodingKeys: String, CodingKey {
            case apiStatus = "api_status"
            case config
        }
    }
    
    // MARK: - Config
    struct Config: Codable {
        let siteName, siteTitle, siteKeywords, siteDesc: String?
        let defualtLang, fileSharing, chatSystem, userLastseen: String?
        let age, deleteAccount, connectivitySystem, maxUpload: String?
        let maxCharacters, messageSeen, messageTyping, allowedExtenstion: String?
        let theme, headerBackground, headerHoverBorder, headerColor: String?
        let bodyBackground, btnColor, btnBackgroundColor, btnHoverColor: String?
        let btnHoverBackgroundColor, settingHeaderColor, settingHeaderBackground, settingActiveSidebarColor: String?
        let settingActiveSidebarBackground, settingSidebarBackground, settingSidebarColor, logoExtension: String?
        let backgroundExtension, videoUpload, audioUpload, headerSearchColor: String?
        let headerButtonShadow, btnDisabled, userRegistration, faviconExtension: String?
        let chatOutgoingBackground, windowsAppVersion, widnowsAppAPIID, widnowsAppAPIKey: String?
        let creditCard, bitcoin, mWithdrawal, affiliateType: String?
        let affiliateSystem, classified, bucketName, region: String?
        let footerBackground, isUtf8, alipay, audioChat: String?
        let smsProvider, footerTextColor, updatedLatest, footerBackground2: String?
        let footerBackgroundN, blogs, canBlogs, push: String?
        let androidMPushID, androidMPushKey, events, forum: String?
        let lastUpdate, movies, yandexTranslationAPI, updateDB15: String?
        let adVPrice, adCPrice: String?
        let emoCDN: String?
        let userAds, userStatus, dateStyle, stickers: String?
        let giphyAPI, findFriends, updateDB152, scriptVersion: String?
        let androidPushNative, androidPushMessages, updateDB153, adsCurrency: String?
        let webPush: String?
        let playtubeURL: String?
        let connectivitySystemLimit, videoAdSkip, updateUserProfile, cacheSidebar: String?
        let androidNPushID, androidNPushKey, ftpHost, ftpPort: String?
        let ftpUsername, ftpPassword, ftpUpload, ftpEndpoint: String?
        let ftpPath, transactionLog, coinpaymentsSecret, coinpaymentsID: String?
        let infobipUsername, infobipPassword, updatev2, giftSystem: String?
        let socialShareTwitter, socialShareGoogle, socialShareFacebook, socialShareWhatsup: String?
        let socialSharePinterest, socialShareLinkedin, socialShareTelegram, stickersSystem: String?
        let dollarToPointCost, commentsPoint, likesPoint, dislikesPoint: String?
        let wondersPoint, reactionPoint, createpostPoint, pointAllowWithdrawal: String?
        let stickyVideoPlayer, pointLevelSystem, commentReports, popularPosts: String?
        let autoFriendUsers, spacesKey, spacesSecret, spaceName: String?
        let spaceRegion, spaces, watermark, googleMap: String?
        let loginAuth, twoFactor, twoFactorType, lastNotificationDeleteRun: String?
        let iosPushMessages, iosMPushID, iosMPushKey, iosPushNative: String?
        let iosNPushID, iosNPushKey, webPushID, webPushKey: String?
        let profileBack, freeDayLimit, adultImages, adultImagesAction: String?
        let adultImagesFile, proDayLimit, visionAPIKey, recaptchaSecretKey: String?
        let bankPayment, bankTransferNote, bankDescription, createblogPoint: String?
        let deepsoundURL: String?
        let english, arabic, dutch, french: String?
        let german, italian, portuguese, russian: String?
        let spanish, turkish: String?
        let currencyArray: [String]?
        let paypalCurrency, stripeCurrency, the2CheckoutCurrency, version: String?
        let forumVisibility, eventsVisibility, productVisibility, paypal: String?
        let pokeSystem, afternoonSystem, providersArray, coloredPostsSystem: String?
        let checkoutPayment, checkoutMode, checkoutSellerID, checkoutPublishableKey: String?
        let checkoutPrivateKey, jobSystem, weatherWidget, commonThings: String?
        let fundingSystem, fundingRequest, donatePercentage, weatherKey: String?
        let logoURL: String?
        let pageCategories, groupCategories, blogCategories, productsCategories: [String: String]?
        let jobCategories: [String: String]?
        let family: [String: String]?
        let postColors: [String: PostColor]?
        let postReactionsTypes: [String]? = nil
        
        enum CodingKeys: String, CodingKey {
            case siteName, siteTitle, siteKeywords, siteDesc, defualtLang, fileSharing, chatSystem
            case userLastseen = "user_lastseen"
            case age, deleteAccount, connectivitySystem, maxUpload, maxCharacters
            case messageSeen = "message_seen"
            case messageTyping = "message_typing"
            case allowedExtenstion, theme
            case headerBackground = "header_background"
            case headerHoverBorder = "header_hover_border"
            case headerColor = "header_color"
            case bodyBackground = "body_background"
            case btnColor = "btn_color"
            case btnBackgroundColor = "btn_background_color"
            case btnHoverColor = "btn_hover_color"
            case btnHoverBackgroundColor = "btn_hover_background_color"
            case settingHeaderColor = "setting_header_color"
            case settingHeaderBackground = "setting_header_background"
            case settingActiveSidebarColor = "setting_active_sidebar_color"
            case settingActiveSidebarBackground = "setting_active_sidebar_background"
            case settingSidebarBackground = "setting_sidebar_background"
            case settingSidebarColor = "setting_sidebar_color"
            case logoExtension = "logo_extension"
            case backgroundExtension = "background_extension"
            case videoUpload = "video_upload"
            case audioUpload = "audio_upload"
            case headerSearchColor = "header_search_color"
            case headerButtonShadow = "header_button_shadow"
            case btnDisabled = "btn_disabled"
            case userRegistration = "user_registration"
            case faviconExtension = "favicon_extension"
            case chatOutgoingBackground = "chat_outgoing_background"
            case windowsAppVersion = "windows_app_version"
            case widnowsAppAPIID = "widnows_app_api_id"
            case widnowsAppAPIKey = "widnows_app_api_key"
            case creditCard = "credit_card"
            case bitcoin
            case mWithdrawal = "m_withdrawal"
            case affiliateType = "affiliate_type"
            case affiliateSystem = "affiliate_system"
            case classified
            case bucketName = "bucket_name"
            case region
            case footerBackground = "footer_background"
            case isUtf8 = "is_utf8"
            case alipay
            case audioChat = "audio_chat"
            case smsProvider = "sms_provider"
            case footerTextColor = "footer_text_color"
            case updatedLatest = "updated_latest"
            case footerBackground2 = "footer_background_2"
            case footerBackgroundN = "footer_background_n"
            case blogs
            case canBlogs = "can_blogs"
            case push
            case androidMPushID = "android_m_push_id"
            case androidMPushKey = "android_m_push_key"
            case events, forum
            case lastUpdate = "last_update"
            case movies
            case yandexTranslationAPI = "yandex_translation_api"
            case updateDB15 = "update_db_15"
            case adVPrice = "ad_v_price"
            case adCPrice = "ad_c_price"
            case emoCDN = "emo_cdn"
            case userAds = "user_ads"
            case userStatus = "user_status"
            case dateStyle = "date_style"
            case stickers
            case giphyAPI = "giphy_api"
            case findFriends = "find_friends"
            case updateDB152 = "update_db_152"
            case scriptVersion = "script_version"
            case androidPushNative = "android_push_native"
            case androidPushMessages = "android_push_messages"
            case updateDB153 = "update_db_153"
            case adsCurrency = "ads_currency"
            case webPush = "web_push"
            case playtubeURL = "playtube_url"
            case connectivitySystemLimit
            case videoAdSkip = "video_ad_skip"
            case updateUserProfile = "update_user_profile"
            case cacheSidebar = "cache_sidebar"
            case androidNPushID = "android_n_push_id"
            case androidNPushKey = "android_n_push_key"
            case ftpHost = "ftp_host"
            case ftpPort = "ftp_port"
            case ftpUsername = "ftp_username"
            case ftpPassword = "ftp_password"
            case ftpUpload = "ftp_upload"
            case ftpEndpoint = "ftp_endpoint"
            case ftpPath = "ftp_path"
            case transactionLog = "transaction_log"
            case coinpaymentsSecret = "coinpayments_secret"
            case coinpaymentsID = "coinpayments_id"
            case infobipUsername = "infobip_username"
            case infobipPassword = "infobip_password"
            case updatev2
            case giftSystem = "gift_system"
            case socialShareTwitter = "social_share_twitter"
            case socialShareGoogle = "social_share_google"
            case socialShareFacebook = "social_share_facebook"
            case socialShareWhatsup = "social_share_whatsup"
            case socialSharePinterest = "social_share_pinterest"
            case socialShareLinkedin = "social_share_linkedin"
            case socialShareTelegram = "social_share_telegram"
            case stickersSystem = "stickers_system"
            case dollarToPointCost = "dollar_to_point_cost"
            case commentsPoint = "comments_point"
            case likesPoint = "likes_point"
            case dislikesPoint = "dislikes_point"
            case wondersPoint = "wonders_point"
            case reactionPoint = "reaction_point"
            case createpostPoint = "createpost_point"
            case pointAllowWithdrawal = "point_allow_withdrawal"
            case stickyVideoPlayer = "sticky_video_player"
            case pointLevelSystem = "point_level_system"
            case commentReports = "comment_reports"
            case popularPosts = "popular_posts"
            case autoFriendUsers = "auto_friend_users"
            case spacesKey = "spaces_key"
            case spacesSecret = "spaces_secret"
            case spaceName = "space_name"
            case spaceRegion = "space_region"
            case spaces, watermark
            case googleMap = "google_map"
            case loginAuth = "login_auth"
            case twoFactor = "two_factor"
            case twoFactorType = "two_factor_type"
            case lastNotificationDeleteRun = "last_notification_delete_run"
            case iosPushMessages = "ios_push_messages"
            case iosMPushID = "ios_m_push_id"
            case iosMPushKey = "ios_m_push_key"
            case iosPushNative = "ios_push_native"
            case iosNPushID = "ios_n_push_id"
            case iosNPushKey = "ios_n_push_key"
            case webPushID = "web_push_id"
            case webPushKey = "web_push_key"
            case profileBack = "profile_back"
            case freeDayLimit = "free_day_limit"
            case adultImages = "adult_images"
            case adultImagesAction = "adult_images_action"
            case adultImagesFile = "adult_images_file"
            case proDayLimit = "pro_day_limit"
            case visionAPIKey = "vision_api_key"
            case recaptchaSecretKey = "recaptcha_secret_key"
            case bankPayment = "bank_payment"
            case bankTransferNote = "bank_transfer_note"
            case bankDescription = "bank_description"
            case createblogPoint = "createblog_point"
            case deepsoundURL = "deepsound_url"
            case english, arabic, dutch, french, german, italian, portuguese, russian, spanish, turkish
            case currencyArray = "currency_array"
            case paypalCurrency = "paypal_currency"
            case stripeCurrency = "stripe_currency"
            case the2CheckoutCurrency = "2checkout_currency"
            case version
            case forumVisibility = "forum_visibility"
            case eventsVisibility = "events_visibility"
            case productVisibility = "product_visibility"
            case paypal
            case pokeSystem = "poke_system"
            case afternoonSystem = "afternoon_system"
            case providersArray = "providers_array"
            case coloredPostsSystem = "colored_posts_system"
            case checkoutPayment = "checkout_payment"
            case checkoutMode = "checkout_mode"
            case checkoutSellerID = "checkout_seller_id"
            case checkoutPublishableKey = "checkout_publishable_key"
            case checkoutPrivateKey = "checkout_private_key"
            case jobSystem = "job_system"
            case weatherWidget = "weather_widget"
            case commonThings = "common_things"
            case fundingSystem = "funding_system"
            case fundingRequest = "funding_request"
            case donatePercentage = "donate_percentage"
            case weatherKey = "weather_key"
            case logoURL = "logo_url"
            case pageCategories = "page_categories"
            case groupCategories = "group_categories"
            case blogCategories = "blog_categories"
            case productsCategories = "products_categories"
            case jobCategories = "job_categories"
            case  family
            case postColors = "post_colors"
            case postReactionsTypes = "post_reactions_types"
        }
    }
    
    // MARK: - CurrencySymbolArray
    struct CurrencySymbolArray: Codable {
        let usd, eur, currencySymbolArrayTRY, gbp: String
        let rub, pln, ils, brl: String
        let inr: String
        
        enum CodingKeys: String, CodingKey {
            case usd = "USD"
            case eur = "EUR"
            case currencySymbolArrayTRY = "TRY"
            case gbp = "GBP"
            case rub = "RUB"
            case pln = "PLN"
            case ils = "ILS"
            case brl = "BRL"
            case inr = "INR"
        }
    }
    
    // MARK: - Genders
    struct Genders: Codable {
        let female, male: String
    }
    
    // MARK: - PostColor
    struct PostColor: Codable {
        let id: Int
        let color1, color2, textColor: String
        let image: String
        let time: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case color1 = "color_1"
            case color2 = "color_2"
            case textColor = "text_color"
            case image, time
        }
    }

   
    struct Get_Site_SettingErrorModel: Codable {
        let apiStatus: String
        let errors: Errors
        
        enum CodingKeys: String, CodingKey {
            case apiStatus = "api_status"
            case errors
        }
    }
    
    // MARK: - Errors
    struct Errors: Codable {
        let errorID, errorText: String
        
        enum CodingKeys: String, CodingKey {
            case errorID = "error_id"
            case errorText = "error_text"
        }
    }
    
    
}

