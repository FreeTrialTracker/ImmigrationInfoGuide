# Admin Import Setup

## Required Environment Variables

You must add the following environment variables in your Bolt environment settings:

### 1. SUPABASE_SERVICE_ROLE_KEY
**Where to find it:**
- Go to your Supabase project dashboard
- Navigate to Settings > API
- Copy the "service_role" key (NOT the anon key)
- This key has admin privileges and must NEVER be exposed to the client

**In Bolt:**
- Add as: `SUPABASE_SERVICE_ROLE_KEY`
- Value: Your Supabase service role key
- This is a server-side only variable

### 2. ADMIN_IMPORT_PASSWORD
**Purpose:**
- Password protection for the admin import page at `/admin/import`
- Choose a strong password

**In Bolt:**
- Add as: `ADMIN_IMPORT_PASSWORD`
- Value: Your chosen admin password (e.g., a strong random password)
- This is a server-side only variable

## Accessing the Admin Import Page

1. Navigate to: `/admin/import`
2. Enter the password you set in `ADMIN_IMPORT_PASSWORD`
3. Session cookie lasts 2 hours
4. Upload CSV files to import immigration pathway data

## CSV Format

Required columns:
- `passport_slug` - Must match existing passport slug
- `destination_slug` - Must match existing country slug
- `pathway_type` - Must be one of: Work, Residency, Digital Nomad, Study, Investor, Retirement, Family, Other
- `pathway_name` - Name of the pathway

Optional columns:
- `summary` - Brief description
- `eligibility` - Eligibility requirements
- `requirements` - Required documents
- `processing_time` - Expected processing duration
- `validity_period` - How long the visa/permit is valid
- `official_url` - Link to official government resource
- `last_updated` - Date in YYYY-MM-DD format

## Import Modes

1. **Upsert (default)** - Inserts new records and updates existing ones based on the unique key (passport_slug, destination_slug, pathway_type, pathway_name)
2. **Dry Run** - Validates the CSV without making any changes

## Security Features

- Password-protected admin area
- HttpOnly session cookies (2-hour expiration)
- Server-side only database operations using service role key
- RLS policies block all client-side writes
- Public read access for immigration pathway data
