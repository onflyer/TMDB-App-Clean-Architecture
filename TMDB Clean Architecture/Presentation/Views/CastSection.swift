//
//  CastSection.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/23/24.
//

import SwiftUI

struct CastSection: View {
    let movie: SingleMovieEntity
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Starring")
                    .font(.headline)
                ForEach(movie.credits?.cast?.prefix(9) ?? []) { person in
                    Text(person.name ?? "N/A")
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("Director(s)")
                    .font(.headline)
                ForEach(movie.credits?.directors ?? []) { person in
                    Text(person.name ?? "N/A")
                }
                Text("Producer(s)").font(.headline)
                    .padding(.top, 1)
                ForEach(movie.credits?.producers ?? []) { person in
                    Text(person.name ?? "N/A")
                }
                Text("Screenwriter(s)").font(.headline)
                    .padding(.top, 1)
                ForEach(movie.credits?.screenWriters ?? []) { person in
                    Text(person.name ?? "N/A")
                }
            }
            Spacer()
        }
    }
}

#Preview {
    CastSection(movie: SingleMovieEntity.dummySingleMovie())
}

