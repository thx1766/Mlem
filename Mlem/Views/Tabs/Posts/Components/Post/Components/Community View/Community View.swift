//
//  Community View.swift
//  Mlem
//
//  Created by David Bureš on 27.03.2022.
//

import SwiftUI

struct Community_View: View {
    let mockPostNames: [String] = ["Test", "Ahoj", "Tohle jsem já", "Nevím", "Tohle je extrémně dlouhý titulek. Jenom mě zajímá, jak to bude vypadat, když tam hodím něco takhle dlouhého"]
    let mockCommunity: String = "Cool Lions"
    
    @ObservedObject var posts = PostData_Decoded()
    
    var body: some View {
        let communityName: String = mockCommunity
        ScrollView {            
            ForEach(posts.decodedPosts) { post in
                NavigationLink(destination: Post_Expanded(postID: post.id)) {
                    Post_Item(postName: post.name, author: post.creatorName, communityName: post.communityName, communityLink: post.communityActorID, postBody: post.body, imageThumbnail: post.thumbnailURL, score: post.score, numberOfComments: post.numberOfComments)
                }
                .buttonStyle(.plain) // Make it so that the link doesn' mess with the styling
            }
        }
        .background(Color.secondarySystemBackground)
        .navigationTitle(communityName)
        .onAppear{
            print("Boutta decode")
            posts.decodeRawJSON()
        }
    }
}

struct Community_View_Previews: PreviewProvider {
    static var previews: some View {
        Community_View()
    }
}