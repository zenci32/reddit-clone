import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class RedditModel extends Equatable {
  RedditModel({
    this.kind,
    this.data,
  });

  String? kind;
  RedditModelData? data;

  factory RedditModel.fromMap(Map<String, dynamic> json) => RedditModel(
        kind: json["kind"],
        data: RedditModelData.fromMap(json["data"]),
      );

  @override
  List<Object?> get props => [kind, data];
}

class RedditModelData {
  RedditModelData({
    this.dist,
    this.modhash,
    this.geoFilter,
    this.children,
    this.before,
  });

  int? dist;
  String? modhash;
  String? geoFilter;
  List<Child>? children;
  String? before;

  factory RedditModelData.fromMap(Map<String, dynamic> json) => RedditModelData(
        dist: json["dist"],
        modhash: json["modhash"],
        geoFilter: json["geo_filter"],
        children:
            List<Child>.from(json["children"].map((x) => Child.fromMap(x))),
        before: json["before"],
      );
}

class Child {
  Child({
    this.kind,
    this.data,
    this.expand = true,
  });

  String? kind;
  bool expand;
  ChildData? data;

  factory Child.fromMap(Map<String, dynamic> json) => Child(
        kind: json["kind"],
        data: ChildData.fromMap(json["data"]),
      );
}

class ChildData {
  ChildData({
    this.subreddit,
    this.selftext,
    this.authorFullname,
    this.saved,
    this.gilded,
    this.clicked,
    this.title,
    this.subredditNamePrefixed,
    this.hidden,
    this.pwls,
    this.linkFlairCssClass,
    this.downs,
    this.thumbnailHeight,
    this.hideScore,
    this.name,
    this.quarantine,
    this.linkFlairTextColor,
    this.upvoteRatio,
    this.authorFlairBackgroundColor,
    this.subredditType,
    this.ups,
    this.totalAwardsReceived,
    this.mediaEmbed,
    this.thumbnailWidth,
    this.isOriginalContent,
    this.secureMedia,
    this.isRedditMediaDomain,
    this.isMeta,
    this.secureMediaEmbed,
    this.linkFlairText,
    this.canModPost,
    this.score,
    this.isCreatedFromAdsUi,
    this.authorPremium,
    this.thumbnail,
    this.authorFlairCssClass,
    this.gildings,
    this.postHint,
    this.isSelf,
    this.created,
    this.linkFlairType,
    this.wls,
    this.authorFlairType,
    this.domain,
    this.allowLiveComments,
    this.selftextHtml,
    this.archived,
    this.noFollow,
    this.isCrosspostable,
    this.pinned,
    this.over18,
    this.preview,
    this.mediaOnly,
    this.linkFlairTemplateId,
    this.canGild,
    this.spoiler,
    this.locked,
    this.authorFlairText,
    this.visited,
    this.subredditId,
    this.authorIsBlocked,
    this.linkFlairBackgroundColor,
    this.id,
    this.isRobotIndexable,
    this.author,
    this.numComments,
    this.sendReplies,
    this.whitelistStatus,
    this.contestMode,
    this.authorPatreonFlair,
    this.authorFlairTextColor,
    this.permalink,
    this.parentWhitelistStatus,
    this.stickied,
    this.url,
    this.subredditSubscribers,
    this.createdUtc,
    this.numCrossposts,
    this.media,
    this.isVideo,
    this.urlOverriddenByDest,
    this.crosspostParentList,
    this.crosspostParent,
  });

  String? subreddit;
  String? selftext;
  String? authorFullname;
  bool? saved;

  var gilded;
  bool? clicked;
  String? title;

  String? subredditNamePrefixed;
  bool? hidden;
  var pwls;
  String? linkFlairCssClass;
  var downs;
  var thumbnailHeight;

  bool? hideScore;
  String? name;
  bool? quarantine;
  String? linkFlairTextColor;
  double? upvoteRatio;
  String? authorFlairBackgroundColor;
  String? subredditType;
  var ups;
  var totalAwardsReceived;
  MediaEmbed? mediaEmbed;
  var thumbnailWidth;

  bool? isOriginalContent;

  Media? secureMedia;
  bool? isRedditMediaDomain;
  bool? isMeta;

  MediaEmbed? secureMediaEmbed;
  String? linkFlairText;
  bool? canModPost;
  var score;

  bool? isCreatedFromAdsUi;
  bool? authorPremium;
  String? thumbnail;

  String? authorFlairCssClass;

  Gildings? gildings;
  String? postHint;

  bool? isSelf;

  var created;
  String? linkFlairType;
  var wls;
  String? authorFlairType;
  String? domain;
  bool? allowLiveComments;
  String? selftextHtml;
  bool? archived;
  bool? noFollow;
  bool? isCrosspostable;
  bool? pinned;
  bool? over18;
  Preview? preview;
  bool? mediaOnly;
  String? linkFlairTemplateId;
  bool? canGild;
  bool? spoiler;
  bool? locked;
  String? authorFlairText;
  bool? visited;
  String? subredditId;
  bool? authorIsBlocked;
  String? linkFlairBackgroundColor;
  String? id;
  bool? isRobotIndexable;
  String? author;
  var numComments;
  bool? sendReplies;
  String? whitelistStatus;
  bool? contestMode;
  bool? authorPatreonFlair;
  String? authorFlairTextColor;
  String? permalink;
  String? parentWhitelistStatus;
  bool? stickied;
  String? url;
  var subredditSubscribers;
  var createdUtc;
  var numCrossposts;
  Media? media;
  bool? isVideo;
  String? urlOverriddenByDest;
  List<CrosspostParentList>? crosspostParentList;
  String? crosspostParent;

  factory ChildData.fromMap(Map<String, dynamic> json) => ChildData(
        subreddit: json["subreddit"],
        selftext: json["selftext"],
        authorFullname: json["author_fullname"],
        saved: json["saved"],
        gilded: json["gilded"],
        clicked: json["clicked"],
        title: json["title"],
        subredditNamePrefixed: json["subreddit_name_prefixed"],
        hidden: json["hidden"],
        pwls: json["pwls"],
        linkFlairCssClass: json["link_flair_css_class"] == null
            ? null
            : json["link_flair_css_class"],
        downs: json["downs"],
        thumbnailHeight:
            json["thumbnail_height"] == null ? null : json["thumbnail_height"],
        hideScore: json["hide_score"],
        name: json["name"],
        quarantine: json["quarantine"],
        linkFlairTextColor: json["link_flair_text_color"],
        upvoteRatio: json["upvote_ratio"].toDouble(),
        authorFlairBackgroundColor: json["author_flair_background_color"],
        subredditType: json["subreddit_type"],
        ups: json["ups"],
        totalAwardsReceived: json["total_awards_received"],
        mediaEmbed: MediaEmbed.fromMap(json["media_embed"]),
        thumbnailWidth:
            json["thumbnail_width"] == null ? null : json["thumbnail_width"],
        isOriginalContent: json["is_original_content"],
        secureMedia: json["secure_media"] == null
            ? null
            : Media.fromMap(json["secure_media"]),
        isRedditMediaDomain: json["is_reddit_media_domain"],
        isMeta: json["is_meta"],
        secureMediaEmbed: MediaEmbed.fromMap(json["secure_media_embed"]),
        linkFlairText:
            json["link_flair_text"] == null ? null : json["link_flair_text"],
        canModPost: json["can_mod_post"],
        score: json["score"],
        isCreatedFromAdsUi: json["is_created_from_ads_ui"],
        authorPremium: json["author_premium"],
        thumbnail: json["thumbnail"],
        authorFlairCssClass: json["author_flair_css_class"],
        gildings: Gildings.fromMap(json["gildings"]),
        postHint: json["post_hint"] == null ? null : json["post_hint"],
        isSelf: json["is_self"],
        created: json["created"],
        linkFlairType: json["link_flair_type"],
        wls: json["wls"],
        authorFlairType: json["author_flair_type"],
        domain: json["domain"],
        allowLiveComments: json["allow_live_comments"],
        selftextHtml:
            json["selftext_html"] == null ? null : json["selftext_html"],
        archived: json["archived"],
        noFollow: json["no_follow"],
        isCrosspostable: json["is_crosspostable"],
        pinned: json["pinned"],
        over18: json["over_18"],
        preview:
            json["preview"] == null ? null : Preview.fromMap(json["preview"]),
        mediaOnly: json["media_only"],
        linkFlairTemplateId: json["link_flair_template_id"] == null
            ? null
            : json["link_flair_template_id"],
        canGild: json["can_gild"],
        spoiler: json["spoiler"],
        locked: json["locked"],
        authorFlairText: json["author_flair_text"],
        visited: json["visited"],
        subredditId: json["subreddit_id"],
        authorIsBlocked: json["author_is_blocked"],
        linkFlairBackgroundColor: json["link_flair_background_color"],
        id: json["id"],
        isRobotIndexable: json["is_robot_indexable"],
        author: json["author"],
        numComments: json["num_comments"],
        sendReplies: json["send_replies"],
        whitelistStatus: json["whitelist_status"],
        contestMode: json["contest_mode"],
        authorPatreonFlair: json["author_patreon_flair"],
        authorFlairTextColor: json["author_flair_text_color"],
        permalink: json["permalink"],
        parentWhitelistStatus: json["parent_whitelist_status"],
        stickied: json["stickied"],
        url: json["url"],
        subredditSubscribers: json["subreddit_subscribers"],
        createdUtc: json["created_utc"],
        numCrossposts: json["num_crossposts"],
        media: json["media"] == null ? null : Media.fromMap(json["media"]),
        isVideo: json["is_video"],
        urlOverriddenByDest: json["url_overridden_by_dest"] == null
            ? null
            : json["url_overridden_by_dest"],
        crosspostParentList: json["crosspost_parent_list"] == null
            ? null
            : List<CrosspostParentList>.from(json["crosspost_parent_list"]
                .map((x) => CrosspostParentList.fromMap(x))),
        crosspostParent:
            json["crosspost_parent"] == null ? null : json["crosspost_parent"],
      );
}

class CrosspostParentList {
  CrosspostParentList({
    this.subreddit,
    this.selftext,
    this.authorFullname,
    this.saved,
    this.gilded,
    this.clicked,
    this.title,
    this.subredditNamePrefixed,
    this.hidden,
    this.pwls,
    this.downs,
    this.thumbnailHeight,
    this.hideScore,
    this.mediaMetadata,
    this.name,
    this.quarantine,
    this.linkFlairTextColor,
    this.upvoteRatio,
    this.subredditType,
    this.ups,
    this.totalAwardsReceived,
    this.mediaEmbed,
    this.thumbnailWidth,
    this.isOriginalContent,
    this.isRedditMediaDomain,
    this.isMeta,
    this.secureMediaEmbed,
    this.canModPost,
    this.score,
    this.isCreatedFromAdsUi,
    this.authorPremium,
    this.thumbnail,
    this.edited,
    this.gildings,
    this.postHint,
    this.isSelf,
    this.created,
    this.linkFlairType,
    this.wls,
    this.authorFlairType,
    this.domain,
    this.allowLiveComments,
    this.selftextHtml,
    this.archived,
    this.noFollow,
    this.isCrosspostable,
    this.pinned,
    this.over18,
    this.preview,
    this.mediaOnly,
    this.canGild,
    this.spoiler,
    this.locked,
    this.visited,
    this.subredditId,
    this.authorIsBlocked,
    this.linkFlairBackgroundColor,
    this.id,
    this.isRobotIndexable,
    this.author,
    this.numComments,
    this.sendReplies,
    this.whitelistStatus,
    this.contestMode,
    this.authorPatreonFlair,
    this.permalink,
    this.parentWhitelistStatus,
    this.stickied,
    this.url,
    this.subredditSubscribers,
    this.createdUtc,
    this.numCrossposts,
    this.isVideo,
  });

  String? subreddit;
  String? selftext;
  String? authorFullname;
  bool? saved;
  var gilded;
  bool? clicked;
  String? title;
  String? subredditNamePrefixed;
  bool? hidden;
  var pwls;
  var downs;
  var thumbnailHeight;
  bool? hideScore;
  MediaMetadata? mediaMetadata;
  String? name;
  bool? quarantine;
  String? linkFlairTextColor;
  double? upvoteRatio;
  String? subredditType;
  var ups;
  var totalAwardsReceived;
  Gildings? mediaEmbed;
  var thumbnailWidth;
  bool? isOriginalContent;
  bool? isRedditMediaDomain;
  bool? isMeta;
  Gildings? secureMediaEmbed;
  bool? canModPost;
  var score;
  bool? isCreatedFromAdsUi;
  bool? authorPremium;
  String? thumbnail;
  bool? edited;
  Gildings? gildings;
  String? postHint;
  bool? isSelf;
  var created;
  String? linkFlairType;
  int? wls;
  String? authorFlairType;
  String? domain;
  bool? allowLiveComments;
  String? selftextHtml;
  bool? archived;
  bool? noFollow;
  bool? isCrosspostable;
  bool? pinned;
  bool? over18;
  Preview? preview;
  bool? mediaOnly;
  bool? canGild;
  bool? spoiler;
  bool? locked;
  bool? visited;
  String? subredditId;
  bool? authorIsBlocked;
  String? linkFlairBackgroundColor;
  String? id;
  bool? isRobotIndexable;
  String? author;
  var numComments;
  bool? sendReplies;
  String? whitelistStatus;
  bool? contestMode;
  bool? authorPatreonFlair;
  String? permalink;
  String? parentWhitelistStatus;
  bool? stickied;
  String? url;
  var subredditSubscribers;
  var createdUtc;
  var numCrossposts;
  bool? isVideo;

  factory CrosspostParentList.fromMap(Map<String, dynamic> json) =>
      CrosspostParentList(
        subreddit: json["subreddit"],
        selftext: json["selftext"],
        authorFullname: json["author_fullname"],
        saved: json["saved"],
        gilded: json["gilded"],
        clicked: json["clicked"],
        title: json["title"],
        subredditNamePrefixed: json["subreddit_name_prefixed"],
        hidden: json["hidden"],
        pwls: json["pwls"],
        downs: json["downs"],
        thumbnailHeight: json["thumbnail_height"],
        hideScore: json["hide_score"],
        mediaMetadata: MediaMetadata.fromMap(json["media_metadata"]),
        name: json["name"],
        quarantine: json["quarantine"],
        linkFlairTextColor: json["link_flair_text_color"],
        upvoteRatio: json["upvote_ratio"].toDouble(),
        subredditType: json["subreddit_type"],
        ups: json["ups"],
        totalAwardsReceived: json["total_awards_received"],
        mediaEmbed: Gildings.fromMap(json["media_embed"]),
        thumbnailWidth: json["thumbnail_width"],
        isOriginalContent: json["is_original_content"],
        isRedditMediaDomain: json["is_reddit_media_domain"],
        isMeta: json["is_meta"],
        secureMediaEmbed: Gildings.fromMap(json["secure_media_embed"]),
        canModPost: json["can_mod_post"],
        score: json["score"],
        isCreatedFromAdsUi: json["is_created_from_ads_ui"],
        authorPremium: json["author_premium"],
        thumbnail: json["thumbnail"],
        edited: json["edited"],
        gildings: Gildings.fromMap(json["gildings"]),
        postHint: json["post_hint"],
        isSelf: json["is_self"],
        created: json["created"],
        linkFlairType: json["link_flair_type"],
        wls: json["wls"],
        authorFlairType: json["author_flair_type"],
        domain: json["domain"],
        allowLiveComments: json["allow_live_comments"],
        selftextHtml: json["selftext_html"],
        archived: json["archived"],
        noFollow: json["no_follow"],
        isCrosspostable: json["is_crosspostable"],
        pinned: json["pinned"],
        over18: json["over_18"],
        preview: Preview.fromMap(json["preview"]),
        mediaOnly: json["media_only"],
        canGild: json["can_gild"],
        spoiler: json["spoiler"],
        locked: json["locked"],
        visited: json["visited"],
        subredditId: json["subreddit_id"],
        authorIsBlocked: json["author_is_blocked"],
        linkFlairBackgroundColor: json["link_flair_background_color"],
        id: json["id"],
        isRobotIndexable: json["is_robot_indexable"],
        author: json["author"],
        numComments: json["num_comments"],
        sendReplies: json["send_replies"],
        whitelistStatus: json["whitelist_status"],
        contestMode: json["contest_mode"],
        authorPatreonFlair: json["author_patreon_flair"],
        permalink: json["permalink"],
        parentWhitelistStatus: json["parent_whitelist_status"],
        stickied: json["stickied"],
        url: json["url"],
        subredditSubscribers: json["subreddit_subscribers"],
        createdUtc: json["created_utc"],
        numCrossposts: json["num_crossposts"],
        isVideo: json["is_video"],
      );
}

class Gildings {
  Gildings();

  factory Gildings.fromMap(Map<String, dynamic> json) => Gildings();
}

class MediaMetadata {
  MediaMetadata({
    this.the3Mzmma96Ton91,
  });

  The3Mzmma96Ton91? the3Mzmma96Ton91;

  factory MediaMetadata.fromMap(Map<String, dynamic> json) => MediaMetadata(
        the3Mzmma96Ton91: The3Mzmma96Ton91.fromMap(json["3mzmma96ton91"]),
      );
}

class The3Mzmma96Ton91 {
  The3Mzmma96Ton91({
    this.status,
    this.e,
    this.m,
    this.p,
    this.s,
    this.id,
  });

  String? status;
  String? e;
  String? m;
  List<S>? p;
  S? s;
  String? id;

  factory The3Mzmma96Ton91.fromMap(Map<String, dynamic> json) =>
      The3Mzmma96Ton91(
        status: json["status"],
        e: json["e"],
        m: json["m"],
        p: List<S>.from(json["p"].map((x) => S.fromMap(x))),
        s: S.fromMap(json["s"]),
        id: json["id"],
      );
}

class S {
  S({
    this.y,
    this.x,
    this.u,
  });

  int? y;
  int? x;
  String? u;

  factory S.fromMap(Map<String, dynamic> json) => S(
        y: json["y"],
        x: json["x"],
        u: json["u"],
      );
}

class Preview {
  Preview({
    this.images,
    this.enabled,
  });

  List<Image>? images;
  bool? enabled;

  factory Preview.fromMap(Map<String, dynamic> json) => Preview(
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        enabled: json["enabled"],
      );
}

class Image {
  Image({
    this.source,
    this.resolutions,
    this.variants,
    this.id,
  });

  Source? source;
  List<Source>? resolutions;
  Gildings? variants;
  String? id;

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        source: Source.fromMap(json["source"]),
        resolutions: List<Source>.from(
            json["resolutions"].map((x) => Source.fromMap(x))),
        variants: Gildings.fromMap(json["variants"]),
        id: json["id"],
      );
}

class Source {
  Source({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );
}

class Media {
  Media({
    this.type,
    this.oembed,
  });

  String? type;
  Oembed? oembed;

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        type: json["type"],
        oembed: Oembed.fromMap(json["oembed"]),
      );
}

class Oembed {
  Oembed({
    this.providerUrl,
    this.version,
    this.title,
    this.type,
    this.thumbnailWidth,
    this.height,
    this.width,
    this.html,
    this.authorName,
    this.providerName,
    this.thumbnailUrl,
    this.thumbnailHeight,
    this.authorUrl,
    this.description,
    this.meanAlpha,
  });

  String? providerUrl;
  String? version;
  String? title;
  String? type;
  int? thumbnailWidth;
  int? height;
  int? width;
  String? html;
  String? authorName;
  String? providerName;
  String? thumbnailUrl;
  int? thumbnailHeight;
  String? authorUrl;
  String? description;
  double? meanAlpha;

  factory Oembed.fromMap(Map<String, dynamic> json) => Oembed(
        providerUrl: json["provider_url"],
        version: json["version"],
        title: json["title"],
        type: json["type"],
        thumbnailWidth: json["thumbnail_width"],
        height: json["height"],
        width: json["width"],
        html: json["html"],
        authorName: json["author_name"],
        providerName: json["provider_name"],
        thumbnailUrl: json["thumbnail_url"],
        thumbnailHeight: json["thumbnail_height"],
        authorUrl: json["author_url"],
        description: json["description"] == null ? null : json["description"],
        meanAlpha:
            json["mean_alpha"] == null ? null : json["mean_alpha"].toDouble(),
      );
}

class MediaEmbed {
  MediaEmbed({
    this.content,
    this.width,
    this.scrolling,
    this.height,
    this.mediaDomainUrl,
  });

  String? content;
  int? width;
  bool? scrolling;
  int? height;
  String? mediaDomainUrl;

  factory MediaEmbed.fromMap(Map<String, dynamic> json) => MediaEmbed(
        content: json["content"] == null ? null : json["content"],
        width: json["width"] == null ? null : json["width"],
        scrolling: json["scrolling"] == null ? null : json["scrolling"],
        height: json["height"] == null ? null : json["height"],
        mediaDomainUrl:
            json["media_domain_url"] == null ? null : json["media_domain_url"],
      );
}

class RedditException implements Exception {
  final String error;
  const RedditException({required this.error});
}
