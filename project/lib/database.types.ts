export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      passports: {
        Row: {
          slug: string
          name: string
          iso_code: string | null
        }
        Insert: {
          slug: string
          name: string
          iso_code?: string | null
        }
        Update: {
          slug?: string
          name?: string
          iso_code?: string | null
        }
      }
      countries: {
        Row: {
          slug: string
          name: string
          region: string
          iso_code: string | null
        }
        Insert: {
          slug: string
          name: string
          region: string
          iso_code?: string | null
        }
        Update: {
          slug?: string
          name?: string
          region?: string
          iso_code?: string | null
        }
      }
      immigration_pathways: {
        Row: {
          id: string
          passport_slug: string
          destination_slug: string
          pathway_type: string
          pathway_name: string
          summary: string
          eligibility: string
          requirements: string
          processing_time: string
          validity_period: string
          official_url: string | null
          last_updated: string
        }
        Insert: {
          id?: string
          passport_slug: string
          destination_slug: string
          pathway_type: string
          pathway_name: string
          summary: string
          eligibility: string
          requirements: string
          processing_time: string
          validity_period: string
          official_url?: string | null
          last_updated?: string
        }
        Update: {
          id?: string
          passport_slug?: string
          destination_slug?: string
          pathway_type?: string
          pathway_name?: string
          summary?: string
          eligibility?: string
          requirements?: string
          processing_time?: string
          validity_period?: string
          official_url?: string | null
          last_updated?: string
        }
      }
    }
  }
}
