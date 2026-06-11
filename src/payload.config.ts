import { postgresAdapter } from '@payloadcms/db-postgres'
import sharp from 'sharp'
import path from 'path'
import { buildConfig, PayloadRequest } from 'payload'
import { fileURLToPath } from 'url'

import { Categories } from './collections/Categories'
import { Cities } from './collections/Cities'
import { Leads } from './collections/Leads'
import { Media } from './collections/Media'
import { Pages } from './collections/Pages'
import { Posts } from './collections/Posts'
import { Services } from './collections/Services'
import { Testimonials } from './collections/Testimonials'
import { Users } from './collections/Users'
import { CityPageTemplate } from './globals/CityPageTemplate/config'
import { Homepage } from './globals/Homepage/config'
import { SiteSettings } from './globals/SiteSettings/config'
import { plugins } from './plugins'
import { defaultLexical } from '@/fields/defaultLexical'
import { getServerSideURL } from './utilities/getURL'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

export default buildConfig({
  admin: {
    avatar: 'default',
    components: {
      beforeDashboard: ['@/components/AdminWelcome'],
      beforeLogin: ['@/components/BeforeLogin'],
      graphics: {
        Icon: '@/components/AdminGraphics/Icon',
        Logo: '@/components/AdminGraphics/Logo',
      },
    },
    meta: {
      titleSuffix: '- 911 Electrics Admin',
      icons: [
        { rel: 'icon', type: 'image/png', sizes: '32x32', url: '/favicon-32x32.png' },
        { rel: 'icon', sizes: '32x32', url: '/favicon.ico' },
      ],
    },
    importMap: {
      baseDir: path.resolve(dirname),
    },
    user: Users.slug,
    livePreview: {
      breakpoints: [
        {
          label: 'Mobile',
          name: 'mobile',
          width: 375,
          height: 667,
        },
        {
          label: 'Tablet',
          name: 'tablet',
          width: 768,
          height: 1024,
        },
        {
          label: 'Desktop',
          name: 'desktop',
          width: 1440,
          height: 900,
        },
      ],
    },
  },
  // This config helps us configure global or default features that the other editors can inherit
  editor: defaultLexical,
  db: postgresAdapter({
    pool: {
      connectionString: process.env.DATABASE_URL,
      max: 5,
    },
  }),
  collections: [Services, Cities, Posts, Pages, Testimonials, Leads, Media, Categories, Users],
  cors: [getServerSideURL()].filter(Boolean),
  globals: [SiteSettings, Homepage, CityPageTemplate],
  plugins,
  secret: process.env.PAYLOAD_SECRET,
  sharp,
  typescript: {
    outputFile: path.resolve(dirname, 'payload-types.ts'),
  },
  jobs: {
    access: {
      run: ({ req }: { req: PayloadRequest }): boolean => {
        // Allow logged in users to execute this endpoint (default)
        if (req.user) return true

        const secret = process.env.CRON_SECRET
        if (!secret) return false

        // If there is no logged in user, then check
        // for the Vercel Cron secret to be present as an
        // Authorization header:
        const authHeader = req.headers.get('authorization')
        return authHeader === `Bearer ${secret}`
      },
    },
    tasks: [],
  },
})
