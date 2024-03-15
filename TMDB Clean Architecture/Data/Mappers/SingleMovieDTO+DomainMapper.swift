//
//  SingleMovieDTO+DomainMapper.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/15/24.
//

import Foundation

extension SingleMovieDTO: DomainMapper {
    func toDomain() -> SingleMovieEntity {
        return SingleMovieEntity(adult: adult, backdropPath: backdropURLString, budget: budget, genres: genres?.map({
            $0.toDomain()
        })  , homepage: homepage, id: id, imdbID: imdbID, originalLanguage: originalLanguage, originalTitle: originalTitle, overview: overview, popularity: popularity, posterPath: posterURLString, releaseDate: yearText, revenue: revenue, runtime: runtime, status: status, tagline: tagline, title: title, video: video, voteAverage: voteAverage, voteCount: voteCount, ratingtext: ratingText, scoreText: scoreText, durationText: durationText, videos: videos?.toDomain(), credits: credits?.toDomain())
    }
}

extension GenreDTO: DomainMapper {
    func toDomain() -> GenreEntity {
        return GenreEntity(id: id, name: name)
    }
}

extension CreditsDTO: DomainMapper {
    func toDomain() -> CreditsEntity {
        return CreditsEntity(cast: cast?.map({
            $0.toDomain()
        }), crew: crew?.map({
            $0.toDomain()
        }), directors: directors?.map({
            $0.toDomain()
        }), producers: producers?.map({
            $0.toDomain()
        }), screenWriters: screenWriters?.map({
            $0.toDomain()
        }))
    }
}

extension CastDTO: DomainMapper {
    func toDomain() -> CastEntity {
       return CastEntity(adult: adult, gender: gender, id: id, knownForDepartment: knownForDepartment, name: name, originalName: originalName, popularity: popularity, profilePath: profilePath, castID: castID, character: character, creditID: creditID, order: order, department: department, job: job)
    }
}



extension MovieVideoResponseDTO: DomainMapper {
    func toDomain() -> MovieVideoResponseEntity {
        return MovieVideoResponseEntity(results: results?.map({
            $0.toDomain()
        }))
    }
    
    
}

extension MovieVideoDTO: DomainMapper {
    func toDomain() -> MovieVideoEntity {
        return MovieVideoEntity(name: name, key: key, site: site, id: id, youtubeURL: youtubeURL)
    }
}
