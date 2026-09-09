CREATE TABLE IF NOT EXISTS pages (
  id TEXT PRIMARY KEY DEFAULT (lower(hex(randomblob(8)))),
  parent_id TEXT REFERENCES pages(id) ON DELETE CASCADE,
  title TEXT NOT NULL DEFAULT 'Untitled',
  icon TEXT DEFAULT NULL,
  cover TEXT DEFAULT NULL,
  position INTEGER NOT NULL DEFAULT 0,
  is_favorite INTEGER NOT NULL DEFAULT 0,
  created_at TEXT DEFAULT (datetime('now')),
  updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS blocks (
  id TEXT PRIMARY KEY DEFAULT (lower(hex(randomblob(8)))),
  page_id TEXT NOT NULL REFERENCES pages(id) ON DELETE CASCADE,
  type TEXT NOT NULL DEFAULT 'paragraph',
  content TEXT NOT NULL DEFAULT '',
  metadata TEXT DEFAULT '{}',
  position INTEGER NOT NULL DEFAULT 0,
  created_at TEXT DEFAULT (datetime('now')),
  updated_at TEXT DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_blocks_page ON blocks(page_id, position);
CREATE INDEX IF NOT EXISTS idx_pages_parent ON pages(parent_id, position);

-- No sample data here. Clawnify applies this file as DDL only: the deploy
-- pipeline rejects any statement that is not CREATE TABLE/INDEX/VIEW/TRIGGER
-- or ALTER TABLE ... ADD COLUMN, so a single INSERT fails the whole deploy.
-- The welcome page and its blocks are seeded by ensureSeeded() in
-- src/server/index.ts, on the first request against an empty database.
