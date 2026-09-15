-- Fictional team handbook for the disposable template preview.
INSERT INTO pages (id, parent_id, title, icon, position, is_favorite) VALUES
 ('team-handbook', NULL, 'Team handbook', '📚', 0, 1),
 ('client-onboarding', 'team-handbook', 'Client onboarding', '📋', 0, 0),
 ('weekly-notes', NULL, 'Weekly notes', '📝', 1, 0);
INSERT INTO blocks (id, page_id, type, content, metadata, position) VALUES
 ('handbook-intro', 'team-handbook', 'paragraph', 'Everything the team needs to welcome clients and keep projects moving.', '{}', 0),
 ('handbook-heading', 'team-handbook', 'heading_2', 'How we work', '{}', 1),
 ('handbook-list', 'team-handbook', 'bulleted_list', 'Keep decisions and next steps close to the project.', '{}', 2),
 ('onboarding-intro', 'client-onboarding', 'paragraph', 'Use this checklist before the first project meeting.', '{}', 0),
 ('onboarding-one', 'client-onboarding', 'bulleted_list', 'Confirm the project owner and goals.', '{}', 1),
 ('onboarding-two', 'client-onboarding', 'bulleted_list', 'Share the timeline and schedule a kickoff.', '{}', 2),
 ('weekly-heading', 'weekly-notes', 'heading_2', 'This week', '{}', 0),
 ('weekly-summary', 'weekly-notes', 'paragraph', 'The welcome kit is ready for review. Next step: collect feedback from the team.', '{}', 1);
