require "graphql/client"
require "graphql/client/http"

module FlexhireManager
    class CurrentUserFetcher < ApplicationService
  
        attr_reader :api_key
  
        def initialize(api_key)
            p ENV["FLEXHIRE_API_URL"]
            @client = Graphlient::Client.new(ENV["FLEXHIRE_API_URL"],
                headers: {
                    'FLEXHIRE-API-KEY' => api_key
                },
                http_options: {
                    read_timeout: 20,
                    write_timeout: 30
                }
            )
        end
  
        def call
            response = @client.execute current_user_query
            response.data.current_user
        end

        def current_user_query
            @client.parse <<~GRAPHQL
            query {
                current_user: currentUser {
                    id
                    name
                    avatar_url: avatarUrl
                    verified
                    video {
                        id
                        optimized_url: optimizedUrl
                        poster_url: posterUrl
                    }
                      webhooks {
                      id
                      url
                    }
                    skills: userSkills {
                        experience
                        skill {
                            id
                            name
                        }
                    }
                    profile {
                        intro: textIntroduction
                        slug
                        url_blog: urlBlog
                        url_dribbble: urlDribbble
                        url_github: urlGithub
                        url_linkedin: urlLinkedin
                        industry: freelancerType {
                            id
                            name
                        }
                        rate: freelancerRate {
                            formatted
                            value
                        }
                        job_types: jobTypes
                        total_experience: totalExperience
                    }
                    timeline: timelineEntries {
                        id
                        title
                        place
                        description
                        date_start: dateStart
                        date_end: dateEnd
                        entry_type: entryType
                    }
                    applications: freelancerContracts(first: 25, filters: {statuses: [job_application_sent, job_application_draft, rejected]}) {
                        total_count: totalCount
                        data: edges {
                        node {
                            status
                            client {
                                id
                                name
                            }
                            firm {
                                id
                                name
                            }
                            job {
                                id
                                title
                                hiring_manager: hiringManager {
                                    id
                                    name
                                }
                            }
                        }
                        }
                    }
                }
            }
            GRAPHQL
        end
    end
end
  
  