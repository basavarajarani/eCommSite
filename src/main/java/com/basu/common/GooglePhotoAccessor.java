package com.basu.common;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.google.gdata.client.photos.PicasawebService;
import com.google.gdata.data.photos.AlbumEntry;
import com.google.gdata.data.photos.AlbumFeed;
import com.google.gdata.data.photos.PhotoEntry;
import com.google.gdata.data.photos.UserFeed;
import com.google.gdata.util.ServiceException;

public class GooglePhotoAccessor {

	public static Map<String,String> retrieveAlbumNames() throws IOException,ServiceException {
		PicasawebService myService = new PicasawebService ("Download Albums");
		
		myService.setUserCredentials("basavaraj.arani@gmail.com", "maisuramallige#4");
		
		URL feedUrl = new URL("https://picasaweb.google.com/data/feed/api/user/default?kind=album");

		UserFeed myUserFeed = myService.getFeed(feedUrl, UserFeed.class);
		
		Map<String,String> albumNames = new Hashtable<String,String>();
		for (AlbumEntry myAlbum : myUserFeed.getAlbumEntries())
		{
			albumNames.put(myAlbum.getName(), myAlbum.getId());
		}
		return albumNames;
	}
	public static List<String> retreiveGooglePics(String albumIdEntry) throws IOException, ServiceException {
		PicasawebService myService = new PicasawebService("Download Album Links");
		myService.setUserCredentials("basavaraj.arani@gmail.com", "maisuramallige#4");
		String []albumIdSplit = albumIdEntry.split("/");
		String albumId = albumIdSplit[albumIdSplit.length-1];

/*		URL feedUrl = new URL("https://picasaweb.google.com/data/feed/api/user/default?kind=album");

		UserFeed myUserFeed = myService.getFeed(feedUrl, UserFeed.class);
		


		System.out.println("Number of Albums:"+myUserFeed.getEntries().size());

		for (AlbumEntry myAlbum : myUserFeed.getAlbumEntries()) {
			
			String albumInfo = myAlbum.getId()+":"+myAlbum.getKind()+":"+myAlbum.getHtmlLink().getHref();
		    System.out.println(albumInfo);
		}
		*/
		
		URL feedUrl = new URL("https://picasaweb.google.com/data/feed/api/user/default/albumid/"+albumId);
		//URL feedUrl = new URL(albumId);

		AlbumFeed feed = myService.getFeed(feedUrl, AlbumFeed.class);

		List<String> googlePhotoList = new ArrayList<String>();
		//Map <String, String> googlePhotoMap = new Hashtable<String, String>();
		for(PhotoEntry photo : feed.getPhotoEntries()) {
		   // System.out.println(photo.getTitle().getPlainText()+":"+photo.getLink(null, null));
			googlePhotoList.add(photo.getMediaContents().get(0).getUrl());
	
/*			for (int i=0;i<photo.getMediaThumbnails().size();i++)
					System.out.println(photo.getTitle().getPlainText()+":"+photo.getMediaThumbnails().get(i).getUrl());
			System.out.println(photo.getTitle().getPlainText()+":"+photo.getMediaContents().get(0).getUrl());*/
/*			System.out.println(photo.getTitle().getPlainText()+":"+photo.getMediaThumbnails().get(0).getUrl()+":"+
							photo.getMediaThumbnails().get(1).getUrl()+":"+photo.getMediaThumbnails().get(2).getUrl());
*/		    //System.out.println(photo.getTitle().getPlainText()+":"+photo.getMediaThumbnails().get(2).getUrl()+":"+
		    	//			photo.getMediaContents().get(0).getUrl());
		}

/*		PhotoFeed photoFeed = myService.getFeed(feedUrl,PhotoFeed.class);
		
		System.out.println("ID:"+photoFeed.getId());
		System.out.println("Link:"+photoFeed.getLinks().get(0).getHref());*/
		
		return googlePhotoList;
	}
}
