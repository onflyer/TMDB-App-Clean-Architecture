////
////  MovieCastSection.swift
////  TMDB App
////
////  Created by Aleksandar Milidrag on 11/20/23.
////
//
//import SwiftUI
//
//struct MovieCastSection: View {
//    
//    let movie: SingleMovieResponse
//    
//    var body: some View {
//        HStack(alignment: .top) {
//            VStack(alignment: .leading) {
//                Text("Starring")
//                    .font(.headline)
//                ForEach(movie.credits.cast.prefix(9)) { person in
//                    Text(person.name)
//                }
//            }
//            .padding(.horizontal)
//            
//            VStack(alignment: .leading) {
//                Text("Director(s)")
//                    .font(.headline)
//                ForEach(movie.credits.directors) { person in
//                    Text(person.name)
//                }
//                Text("Producer(s)").font(.headline)
//                    .padding(.top, 1)
//                ForEach(movie.credits.producers) { person in
//                    Text(person.name)
//                }
//                Text("Screenwriter(s)").font(.headline)
//                    .padding(.top, 1)
//                ForEach(movie.credits.screenWriters) { person in
//                    Text(person.name)
//                }
//            }
//            Spacer()
//        }
//    }
//}
//
//#Preview {
//    MovieCastSection(movie: Movie.stubbedSingleMovieResponse)
//}
