import { z, defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';

const experience = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/experience' }),
  schema: z.object({
    role: z.string(),
    company: z.string(),
    period: z.string(),
    current: z.boolean().default(false),
    stack: z.array(z.string()),
  }),
});

const projects = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/projects' }),
  schema: z.object({
    title: z.string(),
    summary: z.string(),
    stack: z.array(z.string()),
    url: z.string().url().optional(),
  }),
});

const certifications = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/certifications' }),
  schema: z.object({
    title: z.string(),
    issuer: z.string(),
    year: z.number(),
    type: z.enum(['certification', 'degree', 'course']),
  }),
});

export const collections = { experience, projects, certifications };