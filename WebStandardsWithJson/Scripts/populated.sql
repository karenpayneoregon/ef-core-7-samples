USE [EF.Json]
GO
/****** Object:  Table [dbo].[WebStandards]    Script Date: 3/24/2023 7:41:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebStandards](
	[Identifier] [int] IDENTITY(1,1) NOT NULL,
	[Section] [nvarchar](max) NULL,
	[Id] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Uri] [nvarchar](max) NULL,
	[ConformanceLevel] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[Tips] [nvarchar](max) NULL,
	[Remedy] [nvarchar](max) NULL,
	[Exceptions] [nvarchar](max) NULL,
	[RelatedList] [nvarchar](max) NULL,
 CONSTRAINT [PK_WebStandards] PRIMARY KEY CLUSTERED 
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WebStandards] ON 

INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (1, N'1-1-1', N'text-equiv-all', N'Non-text Content', N'All non-text content that is presented to the user has a text alternative that serves the equivalent purpose, except for the situations listed below.', N'http://www.w3.org/TR/WCAG20/#text-equiv-all', N'A', N'Provide text alternatives for non-text content', N'<p><strong>Provide text alternatives for non-text content</strong></p>
<p>Some users browse websites with images turned off (as do some users with slow internet connections). These must be true alternatives to the content: they must provide the same information.</p>
<h2>What to do</h2>
<ul>
  <li>Add a text alternative to all of your images.</li>
  <li>Add a text alternative to your audio and video (a succinct description of the topic).</li>
  <li>Add a name to all of your controls (such as ‘Search’ or ‘Submit’).</li>
</ul>
', N'<p>There are a few types of image that don’t need alt text: spacers, icons, purely decorative, tests and CAPTCHA images.</p>
<p>Icons are usually used to complement text, rather than replace it, so there’s no need to duplicate your efforts here. Customers with screen readers would just hear the same thing twice anyway, which is the opposite of what we’re trying to do.</p>
<p>Spacers are images used for padding, often for ease and not good coding. They are often used to preserve formatting and present no information, so they don’t need alt text.</p>
<p>Tests and CAPTCHAs that would be undermined by text alternatives don’t need them. Although if you do use CAPTCHA, use one with an audio alternative or add your contact details somewhere close by to help your users if they get stuck.</p>
<p>In all these cases, use ‘null’ alt text by simply leaving the alt text out, but do put the quotes in:</p>
<pre class="brush: html; auto-links: false;">&lt;img src=&quot;location-of-image.jpg&quot; alt=&quot;&quot; /&gt;</pre>
<p>Screen readers will then skip the image rather than reading the filename or trying to substitute an alt text.</p>
', N'', N'', N'[{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-4-5\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-4-9\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (2, N'1-2-1', N'media-equiv-av-only-alt', N'Audio-only and Video-only (Prerecorded)', N'For prerecorded audio-only and prerecorded video-only media, the following are true, except when the audio or video is a media alternative for text and is clearly labeled as such:', N'http://www.w3.org/TR/WCAG20/#media-equiv-av-only-alt', N'A', N'Provide an alternative to video-only and audio-only content', N'<p><strong>Provide an alternative to video-only and audio-only content</strong></p>
<p>Some users will find it difficult to use or understand things like podcasts and silent videos or animations.</p>
<h2>What to do</h2>
<ul>
  <li>Write text transcripts for any audio-only media;</li>
  <li>Write text transcripts for any video-only media; or</li>
  <li>Record an audio-track for any video-only media;</li>
  <li>Place the text transcript, or link to it, close to the media.</li>
</ul>
', N'<p>Audio-only and video-only content needs to be supported by text transcripts that convey the same information as the media. Sometimes this is quite simple, other times you have to make a judgement call on what that really means. The best bet is, as always,to be honest with your customers: what does the media convey and does your transcript do the same? Could you swap one for the other?</p>
<p>One of the most common uses for text transcripts is when a podcast is published online. Embedding a podcast in a page is a great way of sharing your content but no good for your customers with hearing impairments. A text transcript should contain everything mentioned in the recording.</p>
<p>Less commonly, some videos do not have sound. Your customers with visual impairments need help with this kind of content. A text transcript for a video without sound should describe what is going on in the video as clearly as possible. Try to focus on
  what the video is trying to say rather than getting bogged down with detail.</p>
<div class=''mailmunch-forms-in-post-middle'' style=''display: none !important;''></div>
<p>As an alternative for video-only content, you could also choose to record an audio track that narrates the video.</p>
<p>For both audio-only and video-only, create your text transcript and place it either directly beneath the content or insert a link next to the content.</p>
', N'', N'<p>If the content is itself an alternative (you don’t have to provide a transcript of the audio track you provided to explain the silent video you used).</p>
', N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-2\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-3\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-2-5\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-2-7\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-2-8\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (3, N'1-2-2', N'media-equiv-captions', N'Captions (Pre-recorded)', N'Captions are provided for all prerecorded audio content in synchronized media, except when the media is a media alternative for text and is clearly labeled as such.', N'http://www.w3.org/TR/WCAG20/#media-equiv-captions', N'A', N'Provide captions for videos with audio', N'<p>Closed captioning is perhaps the most well known tool for people with disabilities. Often known as subtitles, or abbreviated as CC, closed captions have been around since the 1970s.</p>
<p>Multimedia is becoming more and more popular as the average home gets faster and faster internet access. Videos are cropping up everywhere, from news websites to product pages. One of the most visited websites in the world, YouTube, is specifically for online videos. As website owners turn to video, you must think of how users process your multimedia content.</p>
', N'', N'<p>Adding captions to a video is a relatively hard task, compared to something like writing a text transcript or providing alternative text. Captions must be synchronised with the video to be useful, which means marking up the plain text with timestamps.</p>
<p>There are plenty of paid services out there that will do your closed captioning for you, often at reasonable rates. There are also many free programs that will attempt to create your caption file for you, but none as good as human eyes and ears just yet. Like with many areas of web accessibility, your choice is between spending time (writing your own captions) or money (outsourcing).</p>
<p>Google has written a very clear how-to guide on adding captions to YouTube videos, which I’m not going to try and better.</p>
<p>Add captions to all videos with sound.</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-1-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-1\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-2-4\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (4, N'1-2-3', N'media-equiv-audio-desc', N'Audio Description or Media Alternative (Prerecorded)', N'An alternative for time-based media or audio description of the prerecorded video content is provided for synchronized media, except when the media is a media alternative for text and is clearly labeled as such.', N'http://www.w3.org/TR/WCAG20/#media-equiv-audio-desc', N'A', N'Video with audio has a second alternative', N'<p>An audio description is an edited version of a video’s soundtrack that adds more information than the regular soundtrack offers. This might mean narrating movements that are not audibly explained in the video, or adding context to visual information.</p>
<p>The need for audio description isn’t always clear to website owners, yet it is among the most used accessibility feature in the real world. Many cinemas have audio described screenings, where film fans can use earphones that offer a different soundtrack to the regular feature. That soundtrack will be the regular one supplemented with extra information intended to help film lovers with visual impairments.</p>
<p>To meet this guideline, it’s easier to provide users with a text transcript instead of audio description. However, the either/or option only covers Level A. To reach Level AA you would need to offer audio description. For Level AAA you need both audio description and text transcript.</p>
', N'<p>A full text transcript is a document that includes all information present in the audio or video source. This means including any visual cues (for example, ‘The fisherman holds up a large bass.’) as well as dialogue attribution and description.</p>
<p>Providing audio description at this stage will fulfil Guideline 1.2.5 at Level AA but you will need both audio description and a transcript for Guideline 1.2.8 at Level AAA.</p>
<p>If you’re going to the length of audio description for this guideline, you can also satisfy Guideline 1.2.5 and Guideline 1.2.7 by recording extended audio description tracks wherever necessary.</p>
<p>Something like a straight face-to-face interview, or a speech-to-camera would probably not need audio description. If your video conveys all its information through sound, an audio description track is not needed. If you have this in your mind when you create videos, you can easily sidestep what could be a lengthy process.</p>
<p>If you do need to add audio description, there are a number of options available to you. You can pay a firm to narrate an alternative soundtrack for you, or you can do it yourself. As usual, it’s a case of balancing your resources of time and money.</p>
', N'<ul>
	<li>Provide a full text transcript of the video; or</li>
	<li>Provide a version of the video with audio description .</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-1-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-2\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-2-5\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-2-7\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-2-8\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (5, N'1-2-4', N'media-equiv-real-time-captions', N'Captions (Live)', N'Captions are provided for all live audio content in synchronized media.', N'http://www.w3.org/TR/WCAG20/#media-equiv-real-time-captions', N'AA', N'Video with audio has a second alternative', N'<p>Your users sometimes rely on captions to enjoy your video content. Adding captions to live videos helps people use your website when you’re streaming live video.</p>
', N'<p>Live video is mainly used by large broadcasting companies, but you might want to provide a live stream of a seminar for people who can’t physically attend, or perhaps you’re working for a University and need to put graduation ceremonies online.</p>
', N'<p>Use a content management system that allows captions to be added live and probably a professional subtitler to do it for you.</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-2\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (6, N'1-2-5', N'media-equiv-audio-desc-only', N'Audio Description (Prerecorded)', N'Audio description is provided for all prerecorded video content in synchronized media.', N'http://www.w3.org/TR/WCAG20/#media-equiv-audio-desc-only', N'AA', N'Users have access to audio description for video content', N'<p>Some of your users will rely on audio description to help with videos. Adding audio description to your videos means these users have the same information as everyone else.</p>
', N'<p>If you have provided audio description for videos to meet Guideline 1.2.3, you have already fulfilled this guideline.</p>
<p>Your audio description version must include everything that might be lost to a visually impaired user – things like:</p>
<ul>
 <li>Relevant exposition (location, gestures, lighting, colours).</li>
 <li>Identifying new speakers.</li>
 <li>Marking the passing of time.</li>
</ul>
<p>This is by no means an exhaustive list. The key is to think about what information the video provides and ensure a user with a visual impairment gets the same information.</p>
<p>Remember to use clear words, use the present tense and keep in sync with the video.</p>
', N'<p>Make an alternative version of your video with an audio description soundtrack and link to it from near the original content.</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-2\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-3\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-2-7\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-2-8\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (7, N'1-2-6', N'media-equiv-sign', N'Sign Language (Prerecorded)', N'Sign language interpretation is provided for all prerecorded audio content in synchronized media.', N'http://www.w3.org/TR/WCAG20/#media-equiv-sign', N'AAA', N'Provide sign language translations for videos', N'<p>Some of your users will want to view sign language interpretations of your videos. Adding this feature offers those users the same information as others.</p>
', N'', N'<p>Make an alternative version of your video with a sign language interpreter embedded and link to it from near the original content.</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-1-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-2\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-3\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (8, N'1-2-7', N'media-equiv-extended-ad', N'Extended Audio Description (Prerecorded)', N'Where pauses in foreground audio are insufficient to allow audio descriptions to convey the sense of the video, extended audio description is provided for all prerecorded video content in synchronized media.', N'http://www.w3.org/TR/WCAG20/#media-equiv-extended-ad', N'AAA', N'Provide extended audio description for videos', N'<p>Your users who value audio description need to receive the same information that other users get from your video. Extended audio description can help where your video conveys large amounts of information without enough pauses in the regular soundtrack for audio description to work. Extended audio description is simply pausing the video to give a narrator enough time to convey the information in the video.</p>
', N'<ul>
	<li>Hire a video editor to get the timings right and synchronise the audio and video.</li>
	<li>If you chose to use audio description to fulfil Guideline 1.2.3, you may have already satisfied this guideline.</li>
</ul>
', N'<p>Make an alternative version of your video with an extended audio description soundtrack and link to it from near the original content.</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-3\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-2-5\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-2-8\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (9, N'1-2-8', N'media-equiv-text-doc', N'Media Alternative (Prerecorded)', N'An alternative for time-based media is provided for all prerecorded synchronized media and for all prerecorded video-only media.', N'http://www.w3.org/TR/WCAG20/#media-equiv-text-doc', N'AAA', N'Provide a text alternative to your videos', N'<p>While you may have produced captions or audio description to enhance your videos, some users will rely on a text alternative to get the information. Providing a full text transcript of a video, including links to any calls to action, can help make it more accessible.</p>
', N'<ul>
 <li>You may have fulfilled this Guideline if you chose to meet Guideline 1.2.3 with a text transcript and then fulfilled Guideline 1.2.5 with audio description.</li>
 <li>A good transcript contains all information in the video, such as visual cues, description and dialogue attribution.</li>
</ul>
', N'<ul>
 <li>Provide a full text transcript for your video and link to it from near the original content.</li>
 <li>If the video needs audio description, make sure that is also in place.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-2-3\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-2-5\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-2-7\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (10, N'1-2-9', N'media-equiv-live-audio-only', N'Audio-only (Live)', N'An alternative for time-based media that presents equivalent information for live audio-only content is provided.', N'http://www.w3.org/TR/WCAG20/#media-equiv-live-audio-only', N'AAA', N'Provide alternatives for live audio', N'<p>When broadcasting live audio-only content, such as a live podcast or radio stream, some users will rely on an alternative to the audio to understand your content.</p>
', N'<ul>
  <li>To add live captions to an audio broadcast you will need professional software.</li>
  <li>You may also want to hire a professional subtitler to get the best results.</li>
</ul>
', N'<ul>
 <li>Add closed captions to live audio; or</li>
 <li>If the live broadcast is from a prepared script, make the script text available from near the original content.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-2-4\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (11, N'1-3-1', N'content-structure-separation-programmatic', N'Info and Relationships', N'Information, structure,  and relationships conveyed through presentation can be programmatically determined or are available in text.', N'http://www.w3.org/TR/WCAG20/#content-structure-separation-programmatic', N'A', N'Structure your website logically', N'<p>All users benefit when your web page structure is logical. Many of us take things like headings, bullet points, bolding and italics for granted. For your users with disabilities, those elements can make the difference between understanding a website and leaving it. Many forms of assistive technology rely on correct formatting to work correctly, meaning a heading can go a long way for your users.</p>
<p>Because we use formatting elements so often, we can forget how to use them properly. Going back to basics is a great way to improve your content with relatively little effort.</p>
', N'<p>Ensuring that your web pages have an accessible structure is at once a simple and complex task. The level of difficulty depends on the complexity of your website; a page with several levels of headings will take more work than a single-topic blog post.</p>
<p>An efficient way to check your markup is to use a HTML validator. This will tell you if the web page structure has any HTML errors – these errors won’t always equate to accessibility flaws but the cleaner your code the better. Errors like improperly closed paragraph tags are easily remedied.</p>
<p>After using the validator, check pages manually for correctly nested headings and other more visible page elements. Manually check that any forms you use are labelled clearly too, simple things like required field asterisks that lack explanation can cause big problems.</p>
', N'<p>Complying with the need for good web page structure and formatting is a wide-ranging target. Half-measures don''t work, so you can’t use subheadings properly and then throw random bullet points all over the place.</p>
<p>Amongst other things, you must:</p>
<ul>
 <li>Break up content with subheadings for new sections. </li>
 <li>Mark those headings with HTML header tags. </li>
 <li>Use the correct HTML for all structural elements. </li>
 <li>Use valid HTML everywhere else. </li>
 <li>Use clear labels on forms.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-3-2\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-4-3\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00222-4-6\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-4-10\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00224-1-1\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (12, N'1-3-2', N'content-structure-separation-sequence', N'Meaningful Sequence', N'When the sequence in which content is presented affects its meaning, a correct reading sequence can be programmatically determined.', N'http://www.w3.org/TR/WCAG20/#content-structure-separation-sequence', N'A', N'Present your website content in a meaningful order', N'<p>The meaning of content on your website relies on the order you present it. For example, in English we read from left to right and read a left-hand column before a right-hand column. Present the content on your website in an order that your users can understand.</p>
<p>Some of your users rely on assistive technology (like a screen reader) to interpret content. By sequencing content correctly, you can make sure that your users with disabilities can understand your website and improve your overall web accessibility.</p>
', N'<p>Invest in some assistive technology and use it to browse your website. <a href="http://www.nvaccess.org/">NVDA is a free screen reader</a> you can try to get started.</p>
<p>Turn off the site’s Cascading Style Sheet (CSS) and check that your web page displays in the correct order. You can use an extension like <a href="http://www.chromeextensions.org/webmaster-seo/pendule/">Pendule for Chrome</a> to easily toggle CSS on and off.</p>
<p>Using headings to show importance isn’t always straightforward. Headings on a web page are a great way to break up content and show your users the relative importance of each section. Headings in HTML range from 1 (the most important) to 6 (the least important). It’s best to have just one Heading1 (H1) on a web page, to show the title of that page.</p>
<p>However, headings don’t need to descend from 1 to 6 each time you use one. As well as headings that share levels, you can skip levels altogether if that fits your content.</p>
', N'<p>Ensuring you present your content in a meaningful sequence is a wide-ranging part of web accessibility. It applies to all elements of all pages, so is as big or as small a task as your website.</p>
<p>Make sure you:</p>
<ul>
 <li>Present content in a meaningful order.</li>
 <li>Separate navigation menus from content.</li>
</ul>
<p>Always present your content so that it preserves your meaning. That way, it’s great for anyone reading it. The main things to look out for are:</p>
<ul>
 <li>Use paragraphs in order.</li>
 <li>Use headings to show importance.</li>
 <li>Choose whether a list needs numbering or not.</li>
 <li>Use valid HTML and check it with the W3C’s markup validator.15</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-3-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-4-2\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-4-3\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00222-4-6\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (13, N'1-3-3', N'content-structure-separation-understanding', N'Sensory Characteristics', N'Instructions provided for understanding
and operating content do not rely solely on sensory characteristics of components such as shape, size, visual location, orientation, or sound.', N'http://www.w3.org/TR/WCAG20/#content-structure-separation-understanding', N'A', N'Use more than one sense for instructions', N'<p>Sensory characteristics is an important but ridiculous-sounding phrase in web accessibility. It’s actually far less complicated than it sounds. The sensory characteristics of your website are things like shape, sound, position and size.</p>
<p>You''ll often come across sensory characteristics in instructions to your users. Saying things like ‘Use the search bar on the right’ isn’t helpful to a user who doesn’t understand what right is. The main solution is to use more than one indicator for instructions.</p>
', N'<p>Creating accessible instructions is great for everyone. The clearer your instructions are, the more likely users will follow them – this is especially useful for things like buying instructions. Getting this guideline right might just make you more money or get you more users by reducing dropouts.</p>
<p>A good instruction will use several sensory characteristics. Consider the accessibility of these four examples:</p>
<ul>
 <li>‘Use the search box’</li>
 <li>‘Use the search box on the right’</li>
 <li>‘Search by using the green rectangle box labelled ‘Search’ on the right’</li>
 <li>‘Search by using the rectangle box at the very top right of this page’</li>
</ul>
<p>Web designers often have an aversion to adding words, feeling that it adds to confusion. In this case, the opposite can be true. Of course, ideally you want a website that feels instinctive with clear actions. When you need instructions, get them right.</p>
<p>It’s best to avoid sound on a website, other than in media. No one likes unexpected sounds. It’s always hard to tell what the sound means and what you did do make it happen. A prime example is if you use sounds to alert users to errors on a form. The user can''t tell exactly what made the error, they won''t even be sure the sound indicated an error. Your users with hearing impairments have no chance.</p>
<p>For forms, use a clear visual clue for errors and avoid sounds altogether.</p>
<p>By making sure you don’t rely only on colour in your instructions, you can work towards Guideline 1.4.1.</p>
', N'<p>Getting sensory characteristics right is mainly a case of using your common sense. There are no technical requirements, just good and sensible copy writing:</p>
<ul>
 <li>Use more than one sense for instructions.</li>
 <li>Avoid instructions that rely on sound.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-4-1\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (14, N'1-4-1', N'visual-audio-contrast-without-color', N'Use of Color', N'Color is not used as the only visual means of conveying information, indicating an action, prompting a response, or distinguishing a visual element.', N'http://www.w3.org/TR/WCAG20/#visual-audio-contrast-without-color', N'A', N'Don’t use presentation that relies solely on colour', N'<p>Your users with visual impairment need help when you use colour on your website. As many as <a href="http://www.colourblindawareness.org/colour-blindness">1 in 12 men have some degree of colour blindness</a>. That means that somewhere around 8% of your male users will struggle with your website if you don’t use colour correctly.</p>
', N'<p>Check for colour issues by printing samples from your website in black and white. Are there any instructions you can’t follow or is there information you can’t understand?</p>
<p>Making your website accessible to colour blind users is simple. The main area to focus on is giving instructions. Saying things like ‘Click the green button’ or ‘Required fields are red’ is useless to users who can’t see green or red. Back these kinds of instructions up with at least one more identifying remark.</p>
<p>Another point is to make sure that important graphics are not dependent on colour alone. For example, your users might not understand a pie chart where only colour separates the segments. In this case, you should add clear labelling and patterns to the segments.</p>
<p>There’s an overlap here with Guideline 1.3.3. Instructions should always be clear and give your customers the detail they need.</p>
<p>This guideline is not about removing all traces of colour from your website, far from it. It just means that colour must not be the only way of conveying the information or instruction. A common misconception is that web accessibility means making your website black and white, and making it completely boring. Web accessibility is about improving websites, not taking away from them.</p>
', N'<p>Using colour is mainly a case of using your common sense:</p>
<ul>
 <li>Instructions must not rely on colour alone.</li>
 <li>Other information (like charts and graphs) must not rely on colour alone.</li>
</ul>
', NULL, NULL)
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (15, N'1-4-2', N'visual-audio-contrast-dis-audio', N'Audio Control', N'If any audio on a Web page plays automatically for more than 3 seconds, either a mechanism is available to pause or stop the audio, or a mechanism is available to control audio volume independently from the overall system volume level.', N'http://www.w3.org/TR/WCAG20/#visual-audio-contrast-dis-audio', N'A', N'Don’t play audio automatically', N'<p>Automatically playing sounds doesn''t help your users. Your users don''t need audio distractions when visiting your website. You have a hard enough time getting them to do what you want. Some of your users will have problems focusing and unexpected sounds can distract them further.</p>
', N'', N'<ul>
  <li>Don’t have any audio that plays automatically.</li>
  <li>Have all the audio you want, just let your users choose when they want to hear it.</li>
</ul>
', NULL, NULL)
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (16, N'1-4-3', N'visual-audio-contrast-contrast', N'Contrast (Minimum)', N'The visual presentation of text and images of text has a contrast ratio of at least 4.5:1, except for the following:', N'http://www.w3.org/TR/WCAG20/#visual-audio-contrast-contrast', N'AA', N'Contrast ratio between your text and background is at least 4.5:1', N'<p>All of your users will benefit from a good contrast between the text on your website and the background colour. Some of your users with visual impairments need a stronger contrast than others, so getting your colours right is essential.</p>
', N'<ul>
  <li>Picking a contrast of at least 7:1 will also fulfil Guideline 1.4.6.</li>
  <li>Remember to ensure that all colours used conform. This includes links that change colour after being used once, and headings in menus and sidebars, as well as main content.</li>
  <li>Make sure that any embedded charts or images of charts have the minimum contrast between elements (for example, bars, axes and labels).</li>
  <li>This guideline also applies to images of text (but you shouldn’t be using images of text, see Guideline 1.4.5.</li>
</ul>
', N'<p>Make sure the contrast ratio between your text and background is at least 4.5:1.</p>
<p>Do this by:</p>
<ul>
 <li>Using a light background and dark text; or</li>
 <li>Using a dark background and light text; and</li>
 <li>Using <a href="http://webaim.org/resources/contrastchecker/">WebAim’s colour contrast checker</a> to verify your choice.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-4-5\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-4-6\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-4-9\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (17, N'1-4-4', N'visual-audio-contrast-scale', N'Resize text', N'Except for captions and images of text, text can be resized without assistive technology up to 200 percent without loss of content or functionality.', N'http://www.w3.org/TR/WCAG20/#visual-audio-contrast-scale', N'AA', N'Text can be resized to 200% without loss of content or function', N'<p>Some of your users with visual impairments will need to resize text in order to understand it fully. You should allow for up to a 200% resize of text without dropping any content or functions.</p>
', N'<ul>
 <li>Resizing text is different to zooming (which enlarges text, images and layout without preserving formatting).</li>
 <li>Check your website by resizing to 200% in a variety of browsers.</li>
 <li>Make sure your resized text doesn’t require the user to scroll horizontally and you fulfil part of Guideline 1.4.8.</li>
</ul>
', N'', NULL, N'[{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-4-5\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-4-8\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-4-9\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (18, N'1-4-5', N'visual-audio-contrast-text-presentation', N'Images of Text', N'If the technologies being used can achieve the visual presentation, text is used to convey information rather than images of text except.', N'http://www.w3.org/TR/WCAG20/#visual-audio-contrast-text-presentation', N'AA', N'Don''t use images of text', N'<p>Some of your users will visit your website using a text-only browser, or might have images turned off in a regular browser. Images of text cause problems, as they are harder for those users to understand.</p>
<p>Images of text also cause problems for your users if they like to resize websites to read them more clearly because images do not work well this way. They also add to the time it takes your website to load, another key reason users will leave your website.</p>
', N'<p>Images of text are subject to guidelines on color contrast. See Guideline 1.4.3 and Guideline 1.4.6.</p>
', N'<ul>
 <li>Do not use an image of text when you can use plain text.</li>
 <li>Display quotes as text rather than images.</li>
 <li>Use CSS to style headings.</li>
 <li>Use CSS to style navigation menus as text.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-1-1\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-4-3\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-4-6\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-4-9\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (19, N'1-4-6', N'visual-audio-contrast7', N'Contrast (Enhanced)', N'The visual presentation of text and images of text has a contrast ratio of at least 7:1, except for the following:', N'http://www.w3.org/TR/WCAG20/#visual-audio-contrast7', N'AAA', N'Contrast ratio between your text and background is at least 7:1', N'<p>All of your users will benefit from a good contrast between the text on your website and the background colour. Some of your users with visual impairments need a stronger contrast than others, so getting your colours right is essential.</p>
<p>While the minimum contrast for Level AA was 4.5:1, for Level AAA it’s 7:1. This higher level of contrast makes it even easier for everyone to read your content.</p>
', N'<ul>
 <li>You may have fulfilled this guideline when you complied with Guideline 1.4.3.</li>
 <li>Remember to ensure that all colours used conform. This includes links that change colour after being used once, and headings in menus and sidebars, as well as main content.</li>
 <li>Make sure that any embedded charts or images of charts have the minimum contrast between elements (for example, bars, axes and labels).</li>
 <li>This guideline also applies to images of text (but you shouldn''t be using images of text – see Guideline 1.4.5).</li>
</ul>
', N'<p>Make sure the contrast ratio between your text and background is at least 7:1.</p>
<p>Do this by:</p>
<ul>
 <li>Using a light background and dark text; or</li>
 <li>Using a dark background and light text; and</li>
 <li>Using a colour contrast checker to verify your choice.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-4-3\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (20, N'1-4-7', N'visual-audio-contrast-noaudio', N'Low or No Background Audio', N'For prerecorded audio-only content that (1) contains primarily speech in the foreground, (2) is not an audio CAPTCHA or audio logo, and (3) is not vocalization intended to be primarily musical expression such as singing or rapping, at least one of the following is true:', N'http://www.w3.org/TR/WCAG20/#visual-audio-contrast-noaudio', N'AAA', N'Your audio is clear for listeners to hear', N'<p>Some of your users will have difficulties with their hearing. They will not be able to hear your audio content as clearly as other users. You can help by ensuring that all of your audio is clear.</p>
<p>If you have pre-recorded audio-only content, keep background noise to a minimum so that the speaking voices can be heard.</p>
', N'<ul>
 <li>Record your audio in a place you know will be quiet (a room with lots of soft furnishings is best if you haven’t got a studio).</li>
 <li>Embed good quality audio (you should be doing this anyway if you care about your website).</li>
</ul>
', N'<ul>
 <li>Make sure your pre-recorded audio does not contain any background noise; or</li>
 <li>If there has to be some background noise, it is generally 20 decibels lower than the foreground noise. That’s about four times quieter.</li>
</ul>
', NULL, NULL)
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (21, N'1-4-8', N'visual-audio-contrast-visual-presentation', N'Visual Presentation', N'For the visual presentation of blocks of text, a mechanism is available to achieve the following:', N'http://www.w3.org/TR/WCAG20/#visual-audio-contrast-visual-presentation', N'AAA', N'Offer users a range of presentation options', N'<p>Some of your users will have difficulty viewing your website with the same clarity as others. There''s no way you can guess every combination of colours and sizes your users prefer, but you can offer ways for them to customise their view.</p>
<p>Allowing your users to select from a range of visual presentation options will help them to get the best from your website.</p>
', N'<ul>
 <li>The <a href="http://www.w3.org/TR/2010/NOTE-WCAG20-TECHS-20101014/working-examples/G175/index.php">W3C’s in-depth colour picker</a> will cover feature number 1 noted prior.</li>
 <li>The <a href="http://www.bbc.co.uk/accessibility">BBC’s accessibility page</a> has a good range of colour and spacing options.</li>
 <li>Add all visual presentation options to the header of your website, so they are some of the first things that your users see.</li>
</ul>
', N'<p>The following five features are cumulative, as all must be in place to pass Guideline 1.4.8:</p>
<ol>
 <li>Provide a tool that enables your customers to select from a number of background and foreground colours; and</li>
 <li>Text blocks must be no wider than 80 characters (make sure resized browser windows do not need horizontal scrolling); and</li>
 <li>Text is not justified to both sides of the webpage; and</li>
 <li>Provide a tool that enables your users to select from a number of line and paragraph spacing options – one of the options must give line spacing that is at least 1.5 in text blocks and spaces between paragraphs are at least 1.5x line spacing; and</li>
 <li>Text can be resized in a browser up to 200% without requiring the user to scroll horizontally (you may have fulfilled this when you complied with Guideline 1.4.4).</li>
</ol>
', NULL, N'[{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-4-4\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (22, N'1-4-9', N'visual-audio-contrast-text-images', N'Images of Text (No Exception)', N'Images of text are only used for pure decoration or where a particular presentation of text is essential to the information being conveyed.', N'http://www.w3.org/TR/WCAG20/#visual-audio-contrast-text-images', N'AAA', N'Don''t use images of text', N'<p>Some of your users will visit your website using a text-only browser, or might have images turned off in a regular browser. Images of text cause problems, as they are harder for those users to understand.</p>
<p>Images of text also cause problems for your users if they like to resize websites to read them more clearly, because images do not work well this way. They also add to the time it takes your website to load, another key reason users will leave your website.</p>
', N'<ul>
 <li>You may already comply with this guideline, depending on how you addressed Guideline 1.4.5.</li>
 <li>Images of text are subject to guidelines on colour contrast. See Guideline 1.4.3 and Guideline 1.4.6.</li>
</ul>
', N'<ul>
 <li>Don''t use an image of text when you can use plain text.</li>
 <li>Display quotes as text rather than images.</li>
 <li>Use <abbr title="Cascading Style Sheets">CSS</abbr> to style headings.</li>
 <li>Use CSS to style navigation menus as text.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-1-1\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-4-3\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-4-5\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00221-4-6\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (23, N'2-1-1', N'keyboard-operation-keyboard-operable', N'Keyboard', N'All functionality of the content is operable through a keyboard interface without requiring specific timings for individual keystrokes, except where the underlying function requires input that depends on the path of the user''s movement and not just the endpoints.', N'http://www.w3.org/TR/WCAG20/#keyboard-operation-keyboard-operable', N'A', N'Accessible by keyboard only', N'<p>Your customers will have varying degrees of motor skills and will benefit from keyboard accessibility. Customers with motor impairment, including many elderly customers, need your help to navigate your website. Many of these customers will use their keyboard to move around your website.</p>
<p>This article explains what you need to do to meet <strong>Guideline 2.1.1 – Keyboard</strong> from the <a href="http://www.wuhcag.com/web-content-accessibility-guidelines/">Web Content Accessibility Guidelines 2.0</a>.</p>
<p>All parts of your website must pass keyboard accessibility. That means your forms, menus, shopping cart and everything between. On top of that, you cannot require specific timings for keystrokes to access any feature on your website.</p>
', N'', N'<ul>
	<li>A clean <abbr title="HyperText Markup Language">HTML</abbr> and <abbr title="Cascading Style Sheets">CSS</abbr> website will often have keyboard accessibility without further work - a great example of why you need to invest in web design and development from the outset</li>
</ul>
<h2>Auditing keyboard accessibility</h2>
<ul>
	<li>Unplug your mouse and make sure you can fully use your website with your keyboard</li>
	<li>Make sure no function on your website requires timed keystrokes - such as double tap enter/return within two seconds to submit</li>
</ul>
<h2>A few more things</h2>
<p>At the lowest level of accessibility (which <strong>2.1.1 - Keyboard</strong> is), you can get away with functions that require a mouse pointer for input. These are things like free drawing tools and some types of game. Just think carefully about who you are excluding when you use these features.</p>
<p>One thing that gets thrown out a lot by keyboard accessibility advocates is ‘Access keys’. You’re already familiar with access keys, which is why people are quick to accept them as useful. Access keys are keyboard shortcuts like ctrl +  p to print pr ctrl + s to save.</p>
<p>Access keys work great in programs like Microsoft Word and Adobe Reader because they’re in a controlled environment. Out on the wild wild web, things aren’t so simple. Your customers access your website on a number of web browsers; some use Internet Explorer, some Firefox, some Google Chrome and so on... These web browsers have different levels of support for Access keys.</p>
<p>Frustratingly, Access keys are a good idea for keyboard accessibility with bad implementation. If you’re a regular computer user, you probably use ctrl + p  much more often than selecting the menu with your mouse pointer. WebAIM has an <a href="http://webaim.org/techniques/keyboard/accesskey">article about Access keys</a> if you want to know more. My advice: avoid them.</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-1-2\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00222-4-3\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00222-4-7\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (24, N'2-1-2', N'keyboard-operation-trapping', N'No Keyboard Trap', N'If keyboard focus can be moved to a component of the page using a keyboard interface, then focus can be moved away from that component using only a keyboard interface, and, if it requires more than unmodified arrow or tab keys or other standard exit methods, the user is advised of the method for moving focus away.', N'http://www.w3.org/TR/WCAG20/#keyboard-operation-trapping', N'A', N'Your website must not trap keyboard users', N'<p>Your users have varying degrees of motor skills and may use your website with only their keyboard.
You must make sure that keyboard-only users can’t get stuck anywhere on your site. All parts of your website should be reachable by keyboard alone (See Guideline 2.1.1). Your users must also be able to navigate away from all parts of your website. If your users can reach a feature (such as a subscribe form) by keyboard but can’t leave it by keyboard, they are keyboard trapped.</p>
', N'<ul>
 <li>Unplug your mouse and make sure you can fully use your website with your keyboard.</li>
 <li>It’s tempting to use non-standard navigation with a text explanation of what to do, but this isn''t worth your time. Stick to the Tab and arrow keys and the majority of your customers will already know how to use your website.</li>
 <li>Be wary of third-party adverts and widgets, often these are not accessible.</li>
</ul>
', N'<ul>
 <li>Test your website to make sure you can navigate away from, as well as to, all parts of your website by keyboard only.</li>
 <li>Make sure all navigation is controllable by either the ‘Tab’ or arrow keys, which is a standard many people are familiar with.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-1-1\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (25, N'2-1-3', N'keyboard-operation-all-funcs', N'Keyboard (No Exception)', N'All functionality of the content is operable through a keyboard interface without requiring specific timings for individual keystrokes.', N'http://www.w3.org/TR/WCAG20/#keyboard-operation-all-funcs', N'AAA', N'Your website is accessible by keyboard only, without exception', N'<p>Your users have varying degrees of motor skills and may use your website with only their keyboard. Users with motor impairment, including many elderly users, need help to navigate your website.</p>
<p>All parts of your website must be accessible by keyboard only. That means, without a mouse or pointing device, your forms, menus, shopping cart and everything between. On top of that, you cannot require specific timings for keystrokes to access any feature.</p>
', N'<ul>
 <li>Unlike the lower-level Guideline 2.1.1, there are no exceptions here. All aspects of your website must be accessible by keyboard. It’s up to you to decide if Level AAA conformance is worth you removing any mouse-only features.</li>
 <li>Unplug your mouse and make sure you can fully use your website with your keyboard.</li>
 <li>Make sure no function on your website requires timed keystrokes (for example, ‘ double tap on enter within two seconds’ to submit).</li>
 <li>Don’t use ‘access keys’ (assigning a navigation link to a particular key) or page-specific key commands as they can conflict with assistive technology.</li>
 <li>Be wary of third-party adverts and widgets, often these are not accessible.</li>
</ul>
', N'<p>A clean <abbr title="HyperText Markup Language">HTML</abbr> and <abbr title="Cascading Style Sheets">CSS</abbr> website will often have keyboard accessibility without further work. This is a great example of why you need to invest in web design and development from the outset.</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-1-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-1-2\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (26, N'2-2-1', N'time-limits-required-behaviors', N'Timing Adjustable', N'For each time limit that is  set by the content, at least one of the following is true:', N'http://www.w3.org/TR/WCAG20/#time-limits-required-behaviors', N'A', N'Time limits have user controls', N'<p>If any of your content is time-controlled, you risk losing users who need more time read and understand the information on your website.</p>
<p>Time-controlled content is anything on your website that expires or becomes unusable by your users after a certain time. A common example is giving a user ten minutes to fill in and send a form. There are functional reasons to set time limits, but you must consider all of your users.</p>
', N'<ul>
 <li>Take as much content outside of time limits as possible.</li>
 <li>Make sure any user controls you provide are keyboard accessible.</li>
 <li>If you use a pop-up to give your users the option to extend a time limit, consider Guideline 2.2.4.</li>
</ul>
', N'<ul>
<li>If your website uses a time limit:
 <ul>
  <li>Give your users an option to turn off the time limit before it begins (for example, a landing page before the time-controlled page can display a message that shows your customers what to do); or</li>
  <li>Give your users the option to adjust the time limit before it begins, over a range of at least ten times the default setting (you can do this with a landing page too); or</li>
  <li>Give your users the option to extend the period at least twenty seconds before it expires. This must be a simple action like clicking a button and must be available to use at least ten times.</li>
 </ul>
</li>
<li>If your website has moving or animated text, users must be able to pause the movement.</li>
<li>If your website has a feature that updates automatically (for example, with the latest football scores), you must allow your users to delay the frequency of the updates by at least ten times the default setting.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-2-2\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-2-3\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-2-4\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-2-5\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (27, N'2-2-2', N'time-limits-pause', N'Pause, Stop, Hide', N'For moving, blinking, scrolling, or auto-updating information, all of the following are true:', N'http://www.w3.org/TR/WCAG20/#time-limits-pause', N'A', N'Provide user controls for moving content', N'<p>How many times have you visited a website that tries to get your attention with movement? Your eyes catch the scrolling text or a blinking advert, and you take notice for a second or two. More often than not, what you looked at wasn''t why you were visiting the website.</p>
<p>You try to return to what you were doing, except now it’s harder to focus because the movement is in the corner of your eye. You end up leaving the website because you can''t complete what you started.</p>
<p>That’s the effect of scrolling and blinking content on your average user and that’s enough of a reason to avoid it altogether. Now, consider the effect on your users with reading or concentration difficulties. I hope that you can understand why you must provide your users with controls to pause moving content.</p>
', N'<p>The guideline is more forgiving than I am. It lets you offer your users a pause option, but I suggest you remove anything that moves, scrolls or blinks altogether.</p>
<p>It also covers auto-updating content, which is where the strength of the guideline lies. Auto-updating content can be great. You could use it to show the latest sports scores, share prices or your Twitter feed. While the guideline applies to all moving, blinking and scrolling content, I’d love to see you eliminate all but auto-updating content.</p>
', N'<ul>
 <li>Moving, blinking or scrolling content must have an option to pause, stop or hide it; and</li>
 <li>Auto-updating content must have the same options; or</li>
 <li>An option to control frequency (see Guideline 2.2.1 for advice).</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-2-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-3-1\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00222-3-2\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (28, N'2-2-3', N'time-limits-no-exceptions', N'No Timing', N'Timing is not an essential part of the event or activity presented by the content, except for non-interactive synchronized media and real-time events.', N'http://www.w3.org/TR/WCAG20/#time-limits-no-exceptions', N'AAA', N'No time limits on your website', N'<p>If any of your content is time-controlled, you risk losing users who need more time to read and understand the information on your website.</p>
<p>Time-controlled content is anything on your website that expires or becomes unusable by your users after a certain time. A common example is giving a user ten minutes to fill in and send a form. There are functional reasons to set time limits, but you must consider all of your users.</p>
', N'', N'<p>This guideline builds on Guideline 2.2.1. That guideline (at the lower Level A standard of compliance) requires you to offer users a chance to turn off or extend time limits. At Level AAA, this guideline requires that you do not set time limits at all (with two exceptions below).</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-2-1\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-2-5\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (29, N'2-2-4', N'time-limits-postponed', N'Interruptions', N'Interruptions can be postponed or suppressed by the user, except interruptions involving an emergency.', N'http://www.w3.org/TR/WCAG20/#time-limits-postponed', N'AAA', N'Don''t interrupt your users', N'<p>Some of your users will have difficulty maintaining their focus and attention; interrupting their experience may impact their understanding of your content. You can avoid this by eliminating interruptions.</p>
', N'<p>The best thing you can do is eliminate all interruptions by default. Allow your users to interact with webpages naturally and don’t try to surprise or manipulate them. If you can''t capture your users’ interest without a pop-up, you have bigger problems than Level AAA.</p>
<p>If you must use a pop-up, make sure that keyboard focus is on the window-closing ‘X’ icon in the corner that closes the pop-up. This means keyboard users can close the new window. When they do close it, return focus to the place on the page they were at before the pop-up appeared.</p>
', N'<ul>
 <li>Don''t use an automatic redirect or refresh function based on a time delay (for example, if a webpage has moved, do not redirect users to the new page after a certain amount of time).</li>
 <li>Provide an option for turning off all but ‘essential’ interruptions (see below).</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-2-1\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (30, N'2-2-5', N'time-limits-server-timeout', N'Re-authenticating', N'When an authenticated session expires, the user can continue the activity without loss of data after re-authenticating.', N'http://www.w3.org/TR/WCAG20/#time-limits-server-timeout', N'AAA', N'Save user data when re-authenticating', N'<p>It may be essential for your users to re-authenticate their identity for certain functions. For example, you might set a login to expire after a certain amount of time in case a user leaves their computer unattended in the middle of a purchase.</p>
<p>While your website will rightly use this function for your users’ security, you can help your users by saving all information entered by the user. When they re-authenticate (such as logging back in) you can display whatever data they had already entered.</p>
', N'<p>If you do ask your users to re-authenticate after a certain amount of time, consider whether your use of a time limit is justified under Guideline 2.2.1 and Guideline 2.2.3.</p>
', N'<ul>
 <li>When you ask a user to re-authenticate their identity, the user can continue exactly as before with saved data (for example, their shopping basket contents, input into forms or accessibility options).</li>
 <li>Things like surveys and questionnaires can be saved and completed at a later date.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-2-1\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-2-3\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (31, N'2-3-1', N'seizure-does-not-violate', N'Three Flashes or Below Threshold', N'Web pages do not contain anything that flashes more than three times in any one second period, or the flash is below the general flash and red flash thresholds.', N'http://www.w3.org/TR/WCAG20/#seizure-does-not-violate', N'A', N'No content flashes more than three times per second', N'<p>To make your website as safe as possible for all users, you must limit the amount of flashing media. Flashing content can harm the health of some users.</p>
', N'<p>Remember, flashing is different to blinking (see Guideline 2.2.2).</p>
', N'<p>Don''t add anything to your website that flashes more than three times per second.</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-2-2\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-2-3\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (32, N'2-3-2', N'seizure-three-times', N'Three Flashes', N'Web pages do not contain anything that flashes more than three times in any one second period.', N'http://www.w3.org/TR/WCAG20/#seizure-three-times', N'AAA', N'No content flashes more than three times per second', N'<p>To make websites as safe as possible for all users, you must limit the amount of flashing media. Flashing content can harm the health of some users.</p>
', N'<ul>
 <li>This builds on Guideline 2.3.1 by removing an exception that I recommend you ignore anyway.</li>
 <li>Remember, flashing is different to blinking (see Guideline 2.2.2).</li>
</ul>
', N'<p>Don''t add anything to your website that flashes more than three times a second.</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-2-2\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-3-1\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (33, N'2-4-1', N'navigation-mechanisms-skip', N'Bypass Blocks', N'A mechanism is available to bypass blocks of content that are repeated on multiple Web pages.', N'http://www.w3.org/TR/WCAG20/#navigation-mechanisms-skip', N'A', N'Provide a ‘Skip to Content’ link', N'<p>Screen readers announce all of the links on the page to the user, in order.  To help your users navigate your website, provide a way for them to bypass parts of each page, such as long navigation links, links in your header and other repetitive content.</p>
<p>You can help your users bypass these blocks by adding a ‘Skip to Content’ link to your website''s header. This link moves the user from the top of the page (above your header) down to the start of the page’s content. This means users with screen readers can skip the repetitive content and get a better experience of your website.</p>
<p>The same goes for users who browse your website with a lot of zoom in order to understand it. They need extra help navigating to what''s important. Allowing them to skip your menu helps.</p>
', N'', N'<p>Add a ‘Skip to Content’ link to all pages on your website. It’s best if you make the link visible.</p>
<p>The easiest way to add a ‘Skip to Content’ link to your website is to use of a great piece of code from the guys on the PayPal Accessibility Team. They produced something called <a href="https://github.com/paypal/skipto">skipto</a>, which adds a link for you. Best of all if you’re using WordPress or Drupal, there are plugins you can use.</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-3-2\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-4-2\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00223-2-3\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (34, N'2-4-10', N'navigation-mechanisms-headings', N'Section Headings', N'Section headings are used to organize the content.', N'http://www.w3.org/TR/WCAG20/#navigation-mechanisms-headings', N'AAA', N'Break up content with headings', N'<p>Adding section headings to all content will help your users understand your website. They are useful for users who have difficulty focusing or remembering where they are on a page, as well as users with a visual impairment, who may navigate by skipping between headings.</p>
<p>You can help these users, and everyone else, by ensuring that all content on your website is broken up by clear and informative headings.</p>
', N'<ul>
 <li>The <abbr title="World Wide Web Consortium">W3C</abbr> define a <q>section</q> as a <q>self-contained portion of written content that deals with one or more related topics or thoughts.</q><a href="http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-headings.html"> See ''Understanding WCAG 2.0''</a></li>
 <li>A section may consist of one or more paragraphs and include graphics, tables, lists and sub-sections.</li>
 <li>Beware of making your content harder to read by forcing in too many headings.</li>
</ul>
', N'<p>Add a heading for every new thought or topic in your content (for example, a travel article may have headings to indicate the distinct sections on dining, transportation, and lodging).</p>
', NULL, N'[{"ConformanceLevel":"\u0022\u0022","Section":"\u00221-3-1\u0022"},{"ConformanceLevel":"\u0022\u0022","Section":"\u00221-3-2\u0022"},{"ConformanceLevel":"\u0022\u0022","Section":"\u00222-4-6\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (35, N'2-4-2', N'navigation-mechanisms-title', N'Page Titled', N'Web pages have titles that describe topic or purpose.', N'http://www.w3.org/TR/WCAG20/#navigation-mechanisms-title', N'A', N'Use helpful and clear page titles', N'<p>Web page titles tell your users where they are on your website. A good title tells your users which page they are on and what that page is for.</p>
<p>A page title is what users see in the very top bar of your web browser. A good web page title tells users what the page is about without needing to read more. This lets users quickly understand if they are on the right page.</p>
', N'<ul>
 <li>In many cases, it makes sense to repeat the page title or a variation of it as the top heading on your page. </li>
 <li>Type all of your page titles into a spreadsheet and review them.  If they make sense out of context, they will work on your website.</li>
 <li>Use these page titles in your sitemap (See Guideline 2.4.5 and Guideline 2.4.8) to make it more accessible.</li>
</ul>
', N'<p>Give each page on your website a unique and descriptive title.</p>
<p>Many websites use a Content Management System (CMS) that controls page titles. Don''t worry – this isn''t as scary as it sounds. You’ve probably already got one, such as the free and popular WordPress. A good CMS will allow you to set individual page titles with no need to touch any code.</p>
<p>A useful format for writing page titles is: ‘Page name – Page description – Website name’</p>
<p>For example: ‘About Us – Learn our Secrets – ACME Corp’</p>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-3-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-3-2\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00222-4-5\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-4-8\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (36, N'2-4-3', N'navigation-mechanisms-focus-order', N'Focus Order', N'If a Web page can be navigated sequentially and the navigation sequences affect meaning or operation, focusable components receive focus in an order that preserves meaning and operability.', N'http://www.w3.org/TR/WCAG20/#navigation-mechanisms-focus-order', N'A', N'Pages work in a logical order', N'<p>Your users need to find their way around your website in a sequential and meaningful order. You can control this with the ‘focus order’ of your website.</p>
<p>‘Focus order’ is the sequence in which a user accesses elements on your website. For example, some users can''t use a mouse and will ‘tab’ through your website – they must access elements in an order that makes sense. This order is as simple as a bit of logic, such as going from your header to your menu to your page content.</p>
', N'<p>If you have complied with Guideline 2.1.1, you may have already covered elements of this guideline.</p>
', N'<ul>
 <li>A well-made HTML website will often comply with this guideline.</li>
 <li>Unplug your mouse and verify that you can use the ‘Tab’ key to navigate to every part of your website and use every function, including search boxes and forms – make sure each page has a sensible focus order.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-3-2\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-1-1\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00222-4-7\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (37, N'2-4-4', N'navigation-mechanisms-refs', N'Link Purpose (In Context)', N'The purpose of each link can be determined from the link text alone or from the link text together with its programmatically determined link context, except where the purpose of the link would be ambiguous to users in general.', N'http://www.w3.org/TR/WCAG20/#navigation-mechanisms-refs', N'A', N'Every link''s purpose is clear from its context', N'<p>It''s essential that you make your hyperlinks (usually just called ‘links’) clear and easy to understand.
Users with assistive technology, like a screen reader, often hear all the links on a page to help them find where they want to go. Others may view your website highly magnified, so the user will only see the link text and a few words around it at any one time.</p>
<p>To help your users, your link text (the words that are linked, often called ‘anchor text’) must make the link destination clear, in the context of their surrounding content.</p>
', N'<p>Full disclosure: there is another option, but it’s not an approach I recommend. You could explain the purpose of a link in its title attribute. However, title attributes are not a great solution as they have patchy support across web browsers, screen readers and other types of assistive technology. Leverage your other options to make links clear.</p>
<p>A good writer will only ever need the first option, making the link purpose clear for the link text. It is the most accessible solution and the best for your users. There is always a way to make your link accessible using link text alone.  At Level AAA, Guideline 1.4.9 requires you to make links accessible using only the link text anyway.</p>
', N'<p>To comply with this guideline, make sure that for each link on your website:</p>
<ul>
 <li>The purpose of the link is clear from the link text (for example, ‘My blog’); or</li>
 <li>The purpose of the link is clear from the surrounding content, meaning the same sentence, paragraph or cell in a table (for example, ‘Visit my blog’ ); or</li>
 <li>If the link is an image, the alt text of the image makes the link purpose clear (for example, ‘Luke McGrath – Visit my blog’); and</li>
 <li>Links with the same destination have the same description (but links don’t share a description if they point to different places).</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-1-1\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00221-4-9\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (38, N'2-4-5', N'navigation-mechanisms-mult-loc', N'Multiple Ways', N'More than one way is available to locate a Web page within a set of Web pages except where the Web Page is the result of, or a step in, a process.', N'http://www.w3.org/TR/WCAG20/#navigation-mechanisms-mult-loc', N'AA', N'Offer several ways to find pages on your website', N'<p>All of your users benefit from a website designed with them in mind. They need a variety of ways to navigate to the pages they want to visit. Some of your users will have difficulty understanding your website, so will benefit even more from clear navigation and different ways to access your pages.</,p>
', N'<ul>
 <li>A good HTML sitemap will depend on the structure of your website. Design your sitemap so that it best reflects the structure of your website pages and contains all your pages.</li>
 <li>A ‘related pages’ section (which shows links to similar pages on your website) is a good way of helping users navigate around your website.</li>
</ul>
', N'<p>Provide multiple ways for users to find your website’s pages by:</p>
<ul>
 <li>Adding an <abbr title="HyperText Markup Language">HTML</abbr> sitemap page (which links to every page on your website) and link to it after the ‘Skip to Content’ link from Guideline 2.4.1; and</li>
 <li>Including a search function on every page (by adding it to the header); and</li>
 <li>Providing a clear and consistent main navigation menu.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-4-2\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-4-1\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-4-8\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (39, N'2-4-6', N'navigation-mechanisms-descriptive', N'Headings and Labels', N'Headings and labels describe topic or purpose.', N'http://www.w3.org/TR/WCAG20/#navigation-mechanisms-descriptive', N'AA', N'Use clear headings and labels', N'<p>A well-written page is always broken up with clear and descriptive headings. They make it easier for your users to scan and find the section they are interested in. Headings also break up large sections of text so that your content isn''t overwhelming to read.</p>
<p>Some of your users benefit further from pages with semantic headings and labels. Headings particularly help people with visual impairments, who often skip between headings when using a screen reader.</p>
<p>Labelling elements on a page will also help these users understand where they are. Elements introduced with <abbr title="HyperText Markup Language 5">HTML5</abbr>, such as ''header'', ''footer'' and ''aside'', will make that even easier to do.</p>
', N'<ul>
 <li>A single letter of the alphabet can be a good heading (for example, in an alphabetical index).</li>
 <li>If you regularly produce similar content, keep headings consistent (for example, a website about film reviews might have ‘Plot’, ‘Characters’ and ‘Verdict’ on each individual page).</li>
 <li>Headings in HTML range from H1 (the most important) to H6 (the least important). It’s best to reserve Heading1 (H1) on a web page for the title of that page. </li>
 <li>Headings don’t need to decrease from 1 to 6 on every page. While you don’t need to use all of the headings, they should still be sequential. For example, avoid skips from H2 to H4.</li>
</ul>
', N'<ul>
 <li>Use informative headings and subheadings where appropriate (a change in topic or purpose) to aid navigation through your content.</li>
 <li>Label all elements (for example, sidebar widgets, forms, search boxes, tables).</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-3-1\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-3-2\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (40, N'2-4-7', N'navigation-mechanisms-focus-visible', N'Focus Visible', N'Any keyboard operable user interface has a mode of operation where the keyboard focus indicator is visible.', N'http://www.w3.org/TR/WCAG20/#navigation-mechanisms-focus-visible', N'AA', N'Ensure keyboard focus is visible and clear', N'<p>Your users need to find their way around your website in a sequential and meaningful order. If they use a keyboard to navigate your website, they should be able to see which element they are on at any time.</p>
<p>The best way to do this is to style a visible border or outline around the element in use, whether it''s a form field, link, menu, content area or any other element. This makes it easier for your users to understand where they are on a page.</p>
', N'<p>A good <abbr title="HyperText Markup Language">HTML</abbr> and CSS website will often already conform to this guideline. Check yours to be sure.</p>
', N'<ul>
 <li>Make the keyboard focus visible on all elements (menu items, form fields, links, etc…).</li>
 <li>Use <abbr title="Cascading Style Sheets">CSS</abbr> to apply a visual aid to keyboard focus – a border and/or underline is best.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-1-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-4-3\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (41, N'2-4-8', N'navigation-mechanisms-location', N'Location', N'Information about the user''s location within a set of Web pages is available.', N'http://www.w3.org/TR/WCAG20/#navigation-mechanisms-location', N'AAA', N'Let users know where they are on your website', N'<p>Some of your users will have problems understanding the structure of your website. They can get lost, especially during interactions like checkouts that take place over a few pages. You can help your users by making it clear where they are on your website.</p>
<p>This might be as simple as adding breadcrumbs and a sitemap to your website.</p>
', N'<ul>
 <li>Use full page titles for breadcrumbs when they are 1-3 words long (otherwise they get too long to be displayed).</li>
 <li>Abbreviate longer titles to make them easier to read (for example, ‘A Guide To Exotic Fish’ could just as well be ‘Exotic Fish’ for the purpose of a breadcrumb).</li>
 <li>For a process that takes a few pages (like a shopping cart), show all the steps in the process and highlight where the user is.</li>
 <li>If a page has a too many breadcrumbs, perhaps your website could be better organised.</li>
 <li>Use your page titles in your sitemap, organised under subheadings.</li>
</ul>
', N'<ul>
 <li>Use breadcrumbs to help with navigation. Show the sequence a user is following and where they are in that sequence. For example: You are here: Home > Fish > Bass; and</li>
 <li>Add a sitemap page to your website (see Guideline 2.4.5) so your users have another way of finding what they want. Add a link to the sitemap somewhere prominent like the header.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-4-1\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00222-4-5\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (42, N'2-4-9', N'navigation-mechanisms-link', N'Link Purpose (Link Only)', N'A mechanism is available to allow the purpose of each link to be identified from link text alone, except where the purpose of the link would be ambiguous to users in general.', N'http://www.w3.org/TR/WCAG20/#navigation-mechanisms-link', N'AAA', N'Every link''s purpose is clear from its text', N'<p>It''s essential that you make your hyperlinks (usually just called ‘links’) clear and easy to understand.
Users with assistive technology, like a screen reader, often hear all the links on a page to help them find where they want to go. Others may view your website highly magnified, so the user will only see the link text and a few words around it at any one time.</p>
<p>To help your users, your link text alone (the words that are linked, often called ‘anchor text’) must make the link destination clear.</p>
', N'<ul>
 <li>This Guideline builds on Guideline 2.4.4 by focusing only on the link text and removing some exceptions.</li>
 <li>Ensure that links with the same destination have the same description (but links don’t share a description if they point to different places).</li>
 <li>‘Click here’ and ‘Read more’ links fail this guideline.</li>
 <li>Avoid using the title attribute (which was an exception in Guideline 2.4.4) as is not sufficient to pass this guideline.</li>
</ul>
', N'<p>To comply with this guideline, make sure that for each link on your website:</p>
<ul>
 <li>The purpose of the link is clear from the link text; or</li>
 <li>If the link is an image, the alt text of the image makes the link purpose clear.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-1-1\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00222-4-4\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00223-2-4\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (43, N'3-1-1', N'meaning-doc-lang-id', N'Language of Page', N'The default human language of each Web page can be programmatically determined.', N'http://www.w3.org/TR/WCAG20/#meaning-doc-lang-id', N'A', N'Every page of your website has a language assigned', N'<p>Setting every webpage''s <abbr title="HyperText Markup Language">HTML</abbr> language is an easy way to help your users, including those browsing your website with assistive technology. Setting a language is important because the way that screen readers pronounce words depends on the HTML language assigned to your website.</p>
', N'<ul>
 <li>Set the language in your template and you’ll only need to do this once.</li>
 <li>If you trade internationally and have different parts of your website in different languages, make sure they are assigned correctly.</li>
 <li>HTML language codes match the <abbr title="International Organisation for Standardisation">ISO</abbr> language codes standard. W3Schools has a <a href="http://www.w3schools.com/tags/ref_language_codes.asp">full list of language codes</a>.</li>
</ul>
', N'<p>Ensure that each page of your website has a language assigned to it.</p>
', NULL, N'[{"ConformanceLevel":"\u0022\u0022","Section":"\u00223-1-3\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (44, N'3-1-2', N'meaning-other-lang-id', N'Language of Parts', N'The human language of each passage or phrase in the  content can be programmatically determined except for proper names, technical terms, words of indeterminate language, and words or phrases that have become part of the vernacular of the immediately surrounding text.', N'http://www.w3.org/TR/WCAG20/#meaning-other-lang-id', N'AA', N'Tell users when the language on a page changes', N'<p>If your website has content in a different language to its main language, you should tell your users about the change. This helps those who use assistive technology to read the full content.</p>
', N'<ul>
 <li><abbr title="HyperText Markup Language">HTML</abbr> language codes match the <abbr title="International Organisation for Standardisation">ISO</abbr> language codes standard.</li>
 <li>If you have an alternative language version or translation of some content, link to it with the name of the language in that language (for example, ‘Francais’, ‘Deutsch’) and add a language tag to the link.</li>
</ul>
', N'<ul>
 <li>Set your website''s main language by meta tag (see Guideline 3.1.1).</li>
 <li>Add a language attribute to content that is not in the main language.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00223-1-1\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (45, N'3-1-3', N'meaning-idioms', N'Unusual Words', N'A mechanism is available for identifying specific definitions of words or phrases used in an unusual or restricted way, including idioms and jargon.', N'http://www.w3.org/TR/WCAG20/#meaning-idioms', N'AAA', N'Explain any strange words', N'<p>Some of your users will find it hard to read unusual uses of words on your website. Things like figurative language, idioms and jargon can be difficult to process. Avoid using unusual words where you can and explain the use of words when you need to use them.</p>
', N'<ul>
 <li>If your use of an unusual word always means the same thing, you only have to define it the first time.</li>
 <li>If your use of an unusual word changes, you must define the word on every occasion (for example, a <q>bass</q> might be a type of fish in one paragraph and a musical instrument in another).</li>
 <li>Always define technical terms and jargon that any user might not understand depending on their familiarity with the subject.</li>
 <li>Wherever possible, avoid using jargon and idioms. These are bad for novices in your industry and users who don''t natively speak your language.</li>
</ul>
', N'<ul>
 <li>Avoid using unusual words and phrases.</li>
 <li>If you need to use an unusual word or phrase, you can explain the meaning to your users by:</li>
 <li>Showing the meaning in the text (for example, ‘I like bass. A bass is a fish.’); or</li>
 <li>Showing the meaning in brackets (for example, ‘I like bass (a type of fish)’; or</li>
 <li>Linking the word to a definition on a glossary page on your website; or</li>
 <li>Linking the word to a definition footnote on the same page.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-1-4\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-1-5\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-1-6\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (46, N'3-1-4', N'meaning-located', N'Abbreviations', N'A mechanism for identifying the expanded form or meaning of abbreviations is available.', N'http://www.w3.org/TR/WCAG20/#meaning-located', N'AAA', N'Explain any abbreviations', N'<p>Some of your users need help understanding your content. Using abbreviations can cause confusion and prevent your users from understanding your website. Avoid using abbreviations where you can and explain them when you need to use them.
<p>Abbreviations (like Dr for Doctor) also include acronyms (<abbr title="North Atlantic Treaty Organisation">NATO</abbr>) and initialisms (<abbr title="Federal Bureau of Investigation">FBI</abbr>).</p>
', N'<ul>
 <li>Avoid using abbreviations wherever possible (for example, instead of the FBI every time you could say ‘Federal Bureau of Investigation’ once then refer to them as ‘the Bureau’. This helps users with a cognitive disability, as they may be confused by abbreviations on each occasion and sending them to a glossary or definition interrupts their concentration (and everyone else’s for that matter).</li>
 <li>The tidiest solution when you need to abbreviate is the HTML option, which creates a hidden expansion that appears on hover and is understood by screen readers.</li>
 <li>If your use of an abbreviation always means the same thing, you only have to define it the first time it appears on a page.</li>
 <li>If your use changes you must define the word on every occasion (for example ‘Dr’ might mean ‘Doctor’ in one paragraph and ‘Drive’ as part of an address in another).</li>
</ul>
', N'<ul>
 <li>Avoid using abbreviations, acronyms and initialisms.</li>
 <li>If you need to use an abbreviation, you can explain the meaning to your users by:</li>
 <li>Showing the meaning in the text (for example, Federal Bureau of Investigation (FBI)); or</li>
 <li>Linking the abbreviation to a definition on a glossary page on your website; or</li>
 <li>Linking the abbreviation to a definition footnote on the same page; or</li>
 <li>Using the abbreviation <abbr title="HyperText Markup Language">HTML</abbr> tag to expand the abbreviation.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-1-3\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-1-5\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-1-6\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (47, N'3-1-5', N'meaning-located', N'Abbreviations', N'A mechanism for identifying the expanded form or meaning of abbreviations is available.', N'http://www.w3.org/TR/WCAG20/#meaning-located', N'AAA', N'Users with nine years of school can read your content', N'<p>All of your users need to read your website. That means you need to write with a range of people in mind, from your College Professor to someone straight out of school.</p>
<p>The key is to write as simply as you can, in clear and plain language.</p>
', N'<ul>
 <li>You can never write something that every human on the planet will understand. </li>
 <li>Short sentences are easiest to understand.</li>
 <li>Stick to one topic per paragraph and one thought per sentence.</li>
 <li>Avoid slang, jargon and idioms.</li>
 <li>Use common words and contractions.</li>
 <li>Write how people speak.</li>
 <li>Use bullet points.</li>
 <li>Use active, not passive, language (for example, ‘The words were written by Luke’ is passive, but ‘Luke wrote the words’ is active).</li>
 <li>Microsoft Word and some online services can check for readability against the Flesch Reading Ease test – aim for a score over 60.</li>
 <li>BUT don’t rely solely on automated tests, use common sense too.</li>
 <li><a href="https://www.gov.uk/government-digital-guidance/content-publishing">GOV.UK has a useful style guide</a> for content producers.</li>
</ul>
', N'<p>The <abbr title="World Wide Web Consortium">W3C</abbr> (the writers of the Guidelines), set a benchmark you can test against. The suggested standard is to write so that a person with 7-9 years of schooling can understand you.</p>
<p>You can get your content to this standard by:</p>
<ul>
 <li>Writing so that someone with no more than nine years of school can understand you (that’s nine years from their first day at school, so no college or further education).</li>
 <li>Adding summaries, images and diagrams to content to help explain meaning.</li>
 <li>Breaking up content with well-organised sections and headings.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-1-3\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-1-4\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-1-6\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (48, N'3-1-6', N'meaning-pronunciation', N'Pronunciation', N'A mechanism is available for identifying specific pronunciation of words where meaning of the words, in context, is ambiguous without knowing the pronunciation.', N'http://www.w3.org/TR/WCAG20/#meaning-pronunciation', N'AAA', N'Explain any words that are hard to pronounce', N'<p>You can help your users by paying attention to words that are hard or confusing to pronounce. Words like these can make it hard for your users to read your content.</p>
<p>This includes words that are hard to pronounce (for example, ‘phenomenon’) and words that are spelled the same but pronounced differently (for example, ‘bow’ v ‘bow’). Take extra time to explain these words to your users.</p>
', N'', N'<ul>
 <li>Avoid using hard-to-pronounce words. </li>
 <li>If you need to use a hard-to-pronounce word, you can explain the meaning to your users by:</li>
 <li>Providing the phonetic pronunciation of words immediately after the word; or</li>
 <li>Linking the word to a pronunciation guide on another page on your website; or</li>
 <li>Linking the word to a pronunciation guide on the same page.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-1-3\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-1-4\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (49, N'3-2-1', N'consistent-behavior-receive-focus', N'On Focus', N'When any user interface component receives focus, it does not  initiate a change of context.', N'http://www.w3.org/TR/WCAG20/#consistent-behavior-receive-focus', N'A', N'Elements do not change when they receive focus', N'<p>If your website doesn’t act as users expect it to, they''ll leave and you won''t see them again.</p>
<p>Focus is vital when considering what happens on your website when users reach elements like forms, videos and other interactive elements. Once an element receives focus from users, whether with a mouse or keyboard, the element must not automatically change (known as ‘changing on focus’). This can disorientate users.</p>
<p>A change of focus is especially troublesome for users who navigate by keyboard.</p>
', N'<ul>
 <li>Most well-made websites will not have any of these errors by default, you would need to choose to add in change on focus.</li>
 <li>A great way to test this guideline is to unplug your mouse and navigate your way round your website. If anything moves, submits or changes on focus, fix it!</li>
</ul>
', N'<ul>
 <li>Ensure no element changes purely by receiving focus.</li>
 <li>Avoid both behavioural and visual modifications.</li>
</ul>
<p>Ensure that:</p>
<ul>
<li>Links don''t open automatically on focus; and</li>
<li>Forms don''t submit without the user taking action (such as clicking the ‘Submit’ button); and</li>
<li>There are no automatic pop-ups; and</li>
<li>Focus never jumps to another element automatically; and</li>
<li>No other action that occurs on focus alone causes the page to change.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-2-2\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (50, N'3-2-2', N'consistent-behavior-unpredictable-change', N'On Input', N'Changing the setting of any  user interface component does not automatically cause a change of context unless the user has been advised of the behavior before using the component.', N'http://www.w3.org/TR/WCAG20/#consistent-behavior-unpredictable-change', N'A', N'Elements do not change when they receive input', N'<p>If you want your users to return to your website, make sure it acts as users expect it to.
When a form receives input from users (for example, typing in an address or selecting a date of birth), it must not automatically skip to another field or auto-submit – known as ‘changing on input’. This can disorientate users.</p>
<p>Only submit form data when a user chooses to click a submit button. It''s common sense behaviour, but if you get it wrong, your users will be frustrated and leave.</p>
', N'<p>The easiest way to pass Guideline 3.2.2 is to use submit buttons and avoid jumping your users between fields. It’s all about leaving the control in your users'' hands, where it belongs.</p>
', N'<p>Here are some examples of the kinds of things to look out for:</p>
<ul>
 <li>Forms must not auto-submit when all fields are filled – this prevents your users from checking and editing what they have written.</li>
 <li>Focus (the field where the user will input next) must not automatically jump to the next field in a form once a field is complete.</li>
 <li>Using a control (like selecting yes or no) must not automatically perform the action (for example, selecting to subscribe to a newsletter in a check box must not automatically subscribe your user, they should be able to click a submit button to confirm their decision).</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-1-1\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-2-5\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (51, N'3-2-3', N'consistent-behavior-consistent-locations', N'Consistent Navigation', N'Navigational mechanisms that are repeated on multiple Web pages within a set of Web pages occur in the same relative order each time they are repeated, unless a change is initiated by the user.', N'http://www.w3.org/TR/WCAG20/#consistent-behavior-consistent-locations', N'AA', N'Use menus in the same place across your website', N'<p>When you visit a website these days, it''s almost second nature to understand where the main menu is and to expect it to be in the same place on every page. Web designers know that having a consistent navigation menu helps users move around websites.</p>
<p>Consistent navigation helps users who may have trouble moving around a website and find themselves ‘lost’ more often than others. Your users who rely on spatial navigation, due to impaired sight, or need extra help understanding your website will thank you.</p>
<p>This consistency also applies to standard parts of your website – things like your search box. Don''t move them all over the place, use a consistent template for key elements.</p>
', N'<p>Using a standard template for your website will help you meet this guideline.</p>
', N'<ul>
 <li>Keep navigation menus in the same location on all pages; and</li>
 <li>Present the options in navigation menus in the same order on all pages; and</li>
 <li>Keep all other standard elements (for example, your search box) in the same location on all pages.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-4-1\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00222-4-5\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00223-2-4\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-4-8\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (52, N'3-2-4', N'consistent-behavior-consistent-functionality', N'Consistent Identification', N'Components that have the same functionality within a set of Web pages are identified consistently.', N'http://www.w3.org/TR/WCAG20/#consistent-behavior-consistent-functionality', N'AA', N'Use menus in the same place across your website', N'<p>It should be obvious that using consistent identification across your website helps your users move around, interact and do what it is you want them to do. Sadly, it’s often overlooked and buttons, icons or links with the same function look completely different.</p>
<p>Users with screen readers and screen magnifiers benefit even further from consistent identification. They often use familiarity as a means of understanding and selecting functions. Therefore, elements with the same function should be labelled and appear consistent across your website. This includes visually hidden labels for screen readers.</p>
', N'<ul>
 <li>Consistent is not the same as identical (for example, an arrow icon might link to the next page in a series, but depending on the page the text alternative would be ‘Go to page X’).</li>
 <li>An image can have different meanings in different contexts, so require different text alternatives to pass this guideline. For example, a tick icon or check mark can mean both ‘fishing line included with purchase’ and ‘registration form filled in successfully’).</li>
</ul>
', N'<p>Ensure that:</p>
<ul>
 <li>Any icons used are consistent (for example, ‘Print page’ or Twitter link); and</li>
 <li>Elements with the same function are labelled and named consistently; or</li>
 <li>Elements with the same function have a consistent text alternative.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-1-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-4-4\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00222-4-9\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00223-2-2\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00224-1-2\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (53, N'3-2-5', N'consistent-behavior-no-extreme-changes-context', N'Change on Request', N'Changes of context are initiated only by user request or a mechanism is available to turn off such changes.', N'http://www.w3.org/TR/WCAG20/#consistent-behavior-no-extreme-changes-context', N'AAA', N'Don’t change elements on your website until users ask', N'<p>Some of your users find automatic changes hard to deal with. Unexpected actions can interrupt their concentration and prevent them from reaching their goals. Help your users by keeping them in control and avoiding elements on your website that change automatically.</p>
', N'<ul>
 <li>This guideline builds on Guideline 3.2.2 and Guideline 2.2.2 by removing some exceptions, so you may already have passed!</li>
 <li>The best way to redirect a user from one webpage to another is to do it without them noticing. One of the simplest ways to do this is to edit a website’s .htaccess file, which is in the root directory (not all servers will allow you to edit this file, so check with your hosting provider).</li>
</ul>
', N'<p>To pass this guideline, you need to ensure the following five statements are true:</p>
<ol>
 <li>If you have an element that updates automatically (like a live news ticker), there is an option to pause this and update only when requested; and</li>
 <li>All links open in the same window, unless it’s essential (for example, opening a transcript to a video); and</li>
 <li>If a link does open in a new window, the user is aware of this (for example, in the anchor text of the link or by an icon); and</li>
 <li>Forms do not auto-submit when fields are filled; and</li>
 <li>Any redirect from one page to another is immediate.</li>
</ol>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00222-2-2\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-3-5\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (54, N'3-3-1', N'minimize-error-identified', N'Error Identification', N'If an input error is automatically detected, the item that is in error is identified and the error is described to the user in text.', N'http://www.w3.org/TR/WCAG20/#minimize-error-identified', N'A', N'Clearly identify input errors', N'<p>Everyone makes mistakes, even you and I. Make it easy for users to understand and correct their mistakes with a bit of guidance. Provide timely and clear error identification guidance when users make mistakes on your website. Using error identification keeps your website running smoothly and keeps your users from getting frustrated.</p>
<p>One of the worst areas for mistakes websites are forms, including checkouts, newsletter sign-ups and questionnaires. Any of your users can make a simple error that means they can’t submit your form. If users cannot identify their mistakes, they will leave.</p>
', N'<ul>
 <li>If a form requires input in a certain format, show and describe the required format.</li>
 <li>If a mandatory field is empty, highlight the field and explain what’s required.</li>
 <li>Build forms to be forgiving, accepting variations on the formats you prefer.</li>
 <li>Don''t ask for too much information, just what you need.</li>
 <li>Be specific. Use clear, concise instruction and form field labels.</li>
 <li>Highlight mistakes in forms with colours and symbols.</li>
 <li>Don''t clear a form if a user makes a mistake. Save the information and allow the user to edit their error and continue.</li>
 <li>Provide extra help by giving your contact details on all pages (the header or footer are great) and especially near forms.</li>
</ul>
', N'<ul>
 <li>Identify and explain to the user any mistakes that you can detect automatically.</li>
 <li>Add error explanation close to the error, showing what is wrong and how to fix it.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-3-3\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-4-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00223-3-2\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00223-3-3\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00223-3-4\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (55, N'3-3-2', N'minimize-error-cues', N'Labels or Instructions', N'Labels or instructions are provided when content requires user input.', N'http://www.w3.org/TR/WCAG20/#minimize-error-cues', N'A', N'Label elements and give instructions', N'<p>Chances are your website will have a feature that requires your users to fill in some information. This might be on a checkout page to buy a product, a contact form to get in touch or a newsletter sign-up to opt in to your mailing list. You need to ensure your users know what’s required of them when they reach one of these elements on your website.</p>
<p>Without clear labels and instructions, your users won''t know what to do.</p>
', N'<ul>
 <li>Instructions need to take into account how they use sensory characteristics.</li>
 <li>Think about how your use of colour affects things like required fields if you want to highlight them by colour. Don’t highlight by colour alone, pick a symbol too.</li>
 <li>Consider error identification as well, and make sure that you give helpful instructions when your users make mistakes on forms.</li>
</ul>
', N'<ul>
 <li>Label all input fields clearly and helpfully.</li>
 <li>Where a field needs a specific format, give an example (For example, for a ‘date’ field in a form you might use ‘Enter the date as dd/mm/yyyy’)</li>
 <li>Mark required fields with an icon and explain what the icon means before the form.</li>
 <li>Keep your labels simple – too much explanation can be counter-productive. Things like ‘First name’, ‘Email’ and ‘Your message’ are fine.</li>
 <li>The same goes for instructions, ‘Required fields are in red and have a * symbol’ works great. So does ‘Fill in this form and click ‘Submit’ to get in touch’.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-3-3\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-4-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00223-3-1\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (56, N'3-3-3', N'minimize-error-suggestions', N'Error Suggestion', N'If an input error is automatically detected and suggestions for correction are known, then the suggestions are provided to the user, unless it would jeopardize the security or purpose of the content.', N'http://www.w3.org/TR/WCAG20/#minimize-error-suggestions', N'AA', N'Suggest fixes when users make errors', N'<p>All of your users make mistakes – they''re only human after all. When they make mistakes on your website (whether it''s their fault or not), they get frustrated.</p>
<p>Fortunately, it''s also a great time to demonstrate to your users how much you care about them. Show suggestions and hints when users make mistakes on things like forms and checkouts.</p>
', N'<ul>
 <li>This guideline builds on Guideline 3.3.1, by adding a requirement to make a suggestion for user input to fix errors.</li>
 <li>Be specific.</li>
 <li>If a user makes an error, provide a list of links that the user can follow to jump back to correct their input.</li>
 <li>Make it easy to re-submit incorrect forms by retaining all correct data.</li>
</ul>
', N'<p>To pass this guideline, you need to make sure that:</p>
<ul>
 <li>Your forms identify input errors.</li>
 <li>When the error is missing a required field, communicate this to the user with a text suggestion.</li>
 <li>If the error is in the format of the input, the suggestion shows the correct format (for example, ‘The date must be in the form DD/MM/YYYY’).</li>
 <li>If the error is because the input needed to be from a limited list of values, provide these values and explain them.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00223-3-1\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (57, N'3-3-4', N'minimize-error-reversible', N'Error Prevention (Legal, Financial, Data)', N'For Web pages that cause legal commitments or financial transactions for the user to occur, that modify or delete user-controllable data in data storage systems, or that submit user test responses, at least one of the following is true:', N'http://www.w3.org/TR/WCAG20/#minimize-error-reversible', N'AA', N'Reduce the risk of input errors for sensitive data', N'<p>All users make mistakes when inputting data (for example, into forms and checkouts). You should try to prevent errors occurring, especially when users are committing to legal or financial agreements, or otherwise sharing their data.</p>
<p>Users can make costly mistakes if they don''t fully understand the implications of their actions or can’t rectify their errors. Error prevention is all about reducing risk to your users by adding in confirmation stages to processes that pose a legal or financial risk.</p>
', N'<ul>
 <li>Guideline 3.3.6 widens this guideline to include all types of data transfer, not just these high-cost transactions.</li>
 <li>This guideline applies to deletion of data as well as submission.</li>
 <li>Legal commitments are transactions where the user incurs a legally binding obligation or benefit.</li>
 <li><q>User controlled data</q> means things like name and address fields for a user''s account.</li>
 <li>Provide a confirmation webpage that gives the user a chance to read a summary of everything they have input and positively confirm their actions (especially if inputs were spread over several pages in the process).</li>
 <li>Validate forms inline and add an error message if input is incorrect. Be specific in explaining how to fix mistakes.</li>
</ul>
', N'<p>To pass this guideline, you need to make sure that:</p>
<ul>
 <li>Legal commitments, financial transactions, test responses and changes to user controlled data are reversible; or</li>
 <li>Legal commitments, financial transactions, test responses and changes to user controlled data are checked for input errors and the user is given a chance to correct any mistakes; or</li>
 <li>Add a confirmation page to the data input submission process that summarises the input and the outcome, with an option to correct or discontinue. This page has an input field (for example, a confirm button or checkbox) that acts as confirmation of the submission.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00223-3-1\u0022"},{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00223-3-3\u0022"},{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-3-6\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (58, N'3-3-5', N'minimize-error-context-help', N'Help', N'Context-sensitive help is available.', N'http://www.w3.org/TR/WCAG20/#minimize-error-context-help', N'AAA', N'Your website has detailed help and instructions', N'<p>Your users have a range of abilities. Some will instinctively know how to use your website and others will struggle. You can help your users get the most from your website by offering help wherever you can. This is especially relevant to forms, where your users need to input the right information for the form to work.</p>
', N'<ul>
 <li>A link to further information, such as help for a form, counts as an “essential” exception against opening a link in a new window (see Guideline 3.2.5). Opening a link to help in a new window allows the users to follow the help whilst skipping between windows.</li>
 <li>An example of when further information would help is beside a free text field to answer the question: ‘Why are you a good candidate for this job?’ The help could offer hints and tips on the correct format for an answer. Make certain, for instance, to note any character or word limit.</li>
</ul>
', N'<p>Offer help on your forms by:</p>
<ul>
 <li>Labelling input buttons with the nature of the input (for example, ‘Subscribe’ or ‘Buy’); and</li>
 <li>Where an input field needs more information than a label provides, add a link to that information near the field (for example ‘Help with this answer’); and</li>
 <li>Where a field needs a specific format, use a label, adjacent text or placeholder text showing the correct format (for example, ‘Date: DD/MM/YYYY’).</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022AAA\u0022","Section":"\u00223-2-5\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (59, N'3-3-6', N'minimize-error-reversible-all', N'Error Prevention (All)', N'For Web pages that require the user to submit information, at least one of the following is true:', N'http://www.w3.org/TR/WCAG20/#minimize-error-reversible-all', N'AAA', N'Reduce the risk of all input errors', N'<p>All users make mistakes when inputting data (for example, into forms and checkouts). Aim to prevent these errors occurring, but make it easy for users to correct errors as they occur.</p>
<p>Users can make costly mistakes if they don''t fully understand the implications of their actions or can’t rectify their errors. Error prevention is all about reducing risk to your users.</p>
', N'<ul>
 <li>This guideline expands on Guideline 3.3.4.</li>
 <li>This guideline applies to deletion of data as well as submission.</li>
 <li>Although each technique alone is enough to pass this guideline, add as many of the techniques to your process as possible. </li>
 <li>Provide a confirmation webpage that gives the user a chance to read a summary of everything they have input, and positively confirm their actions (especially if inputs were spread over several pages in the process).</li>
 <li>Validate forms inline and add error messages if input is incorrect. Be specific in explaining how to fix mistakes.</li>
</ul>
', N'<p>To pass this guideline, you need to make sure that:</p>
<ul>
 <li>All data input submissions are reversible; or</li>
 <li>All data input submissions are checked for input errors and the user is given a chance to correct any mistakes; or</li>
 <li>Add a confirmation page to the data input submission process that summarises the input and the outcome, with an option to correct or discontinue. This page has an input field (for example, a confirm button or checkbox) that acts as confirmation of the submission.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022AA\u0022","Section":"\u00223-3-4\u0022"}]')
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (60, N'4-1-1', N'ensure-compat-parses', N'Parsing', N'In content implemented using markup languages, elements have complete start and end tags, elements are nested according to their specifications, elements do not contain duplicate attributes, and any IDs are unique, except where the specifications allow these features.', N'http://www.w3.org/TR/WCAG20/#ensure-compat-parses', N'A', N'Your website has no major code errors', N'<p>Parsing is the way software like web browsers and assistive technology read and understand a website. It''s important that the different technologies your users use to view your website don’t have trouble parsing your website. Parsing is all about your website''s code.</p>
<p>All your users will benefit from a website built on clean and modern HTML. Your website will work properly in all web browsers and on all kinds of devices, from computers to tablets to smartphones.</p>
<p>Your users who rely on assistive technology will benefit from a well-made website as the technology often relies on HTML parsing. Bad or broken <abbr title="HyperText Markup Language">HTML</abbr> is more likely to cause parsing problems for assistive technology and so increase the chance of users leaving your website.</p>
', N'', N'<p>This is a wide-ranging guideline, one that changes with time as standards evolve. Your best protection is hiring a web designer who knows parsing well. Find one through recommendations and ask them about their approach to web standards and accessibility.</p>
<p>Here are the most common issues to watch out for:</p>
<ul>
 <li>Ensure HTML elements have complete start ( &lt; > ) and end ( &lt;/ > ) tags where needed.</li>
 <li>Nest all HTML elements correctly (for example, list objects within an ordered or unordered list).</li>
 <li>Use unique Ids.</li>
 <li>Check that HTML elements don’t contain duplicate attributes.</li>
</ul>
', NULL, NULL)
INSERT [dbo].[WebStandards] ([Identifier], [Section], [Id], [Title], [Description], [Uri], [ConformanceLevel], [Summary], [Detail], [Tips], [Remedy], [Exceptions], [RelatedList]) VALUES (61, N'4-1-2', N'ensure-compat-rsv', N'Name, Role, Value', N'For all user interface components (including but not limited to: form elements, links and components generated by scripts), the name and role can be programmatically determined; states, properties, and values that can be set by the user can be programmatically set; and notification of changes to these items is available to user agents, including assistive technologies.', N'http://www.w3.org/TR/WCAG20/#ensure-compat-rsv', N'A', N'Build all elements for accessibility', N'<p>Everything that''s on your website needs to work to defined standards. Where you''re writing code that''s not <abbr title="HyperText Markup Language">HTML</abbr>, it must conform to HTML-like standards. This means that it will work with various assistive technologies.</p>
<p>The key things to consider are advertising widgets, forms from third parties, things you’ve coded yourself and anything that you add that you can’t be sure how it was coded.</p>
', N'<ul>
 <li>A good – though not foolproof – way to test your website is a HTML validator tool. A validator gives you an idea of how well technology can parse your website. Use it to create a list of priorities.</li>
 <li>The majority of your potential issues will come from third-party code. </li>
 <li>Speak to the developers of any plugins you use and make sure that they’re writing good code.</li>
 <li>Make sure that everything on your website parses correctly.</li>
 <li>Pay close attention to things like names and labels.</li>
</ul>
', N'<ul>
 <li>Use HTML specifications for any script you author for your website.</li>
 <li>If you use a plugin or other element authored by a third party, make sure it uses valid HTML markup.</li>
</ul>
', NULL, N'[{"ConformanceLevel":"\u0022A\u0022","Section":"\u00221-1-1\u0022"},{"ConformanceLevel":"\u0022A\u0022","Section":"\u00224-1-1\u0022"}]')
SET IDENTITY_INSERT [dbo].[WebStandards] OFF
GO
