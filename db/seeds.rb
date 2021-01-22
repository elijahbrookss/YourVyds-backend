

Subscription.destroy_all
Comment.destroy_all
Like.destroy_all
Video.destroy_all
User.destroy_all


elijah = User.create(username: "elijahcbrooks", password: "password1")
isaiah = User.create(username: "isaiahbrooks", password: "password1")
serena = User.create(username: "serenaparke8", password: "password1")


# Video.create(
#   name: "Hello World",
#   user: elijah,
#   video: "https://assets.mixkit.co/video-templates/preview/mixkit-particle-ripple-logo-506-large.mp4",
#   thumbnail: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
#   description: "Fun fact: This is the first video ever made!!!!"
# )
#
# Video.create(
#   name: "Some random video I found online",
#   user: elijah,
#   video: "https://static.videezy.com/system/resources/previews/000/008/297/original/Young_African_American_Woman_Pensive_Headphones_1.mp4",
#   thumbnail: "https://assets.foxdcg.com/dpp-uploaded/images/articles/5e7b84f920127c00183665cc/ANIDOM_WFH_SIMP_REV%5B4%5D%5B1%5D.jpg",
#   description: "Fun fact: This is the second video ever made!!!!"
# )
#
# Video.create(
#   name: "Another random video I found online",
#   user: elijah,
#   video: "https://static.videezy.com/system/resources/previews/000/037/666/original/12_014.mp4",
#   thumbnail: "https://www.owllabs.com/hs-fs/hubfs/fog-3622519_1920-jpg.jpeg?width=882&name=fog-3622519_1920-jpg.jpeg",
#   description: "Fun fact: This is the third video ever made!!!!"
# )
#
# Video.create(
#   name: "Another random video I found online V2",
#   user: elijah,
#   video: "https://static.videezy.com/system/resources/previews/000/037/666/original/12_014.mp4",
#   thumbnail: "https://www.owllabs.com/hs-fs/hubfs/fog-3622519_1920-jpg.jpeg?width=882&name=fog-3622519_1920-jpg.jpeg",
#   description: "Fun fact: This is the fourth video ever made!!!!"
# )


#Subscriptions
Subscription.create(user: elijah, subscribed_to_id: isaiah.id);
Subscription.create(user: elijah, subscribed_to_id: serena.id);
# New subscription
Subscription.create(user: isaiah, subscribed_to_id: elijah.id);
Subscription.create(user: serena, subscribed_to_id: elijah.id);
