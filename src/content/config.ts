import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

// Create docs collection that Starlight expects, loading from /reports/
// Make all fields optional since reports don't have frontmatter
const docs = defineCollection({
  loader: glob({
    pattern: '**/*.md',
    base: './reports',
  }),
  schema: z.object({
    title: z.string().optional(),
    description: z.string().optional(),
  }),
});

export const collections = {
  docs,
};
