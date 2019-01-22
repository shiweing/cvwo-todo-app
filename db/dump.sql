BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `todos` (
	`id`	integer NOT NULL,
	`item`	varchar DEFAULT NULL,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	`category_id`	integer DEFAULT NULL,
	`description`	varchar,
	`completed_at`	datetime,
	PRIMARY KEY(`id`)
);
INSERT INTO `todos` (id,item,created_at,updated_at,category_id,description,completed_at) VALUES (1,'Do mission 1','2019-01-09 08:23:31.886702','2019-01-22 08:19:59.184538',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL);
INSERT INTO `todos` (id,item,created_at,updated_at,category_id,description,completed_at) VALUES (2,'Do mission 2','2019-01-09 08:23:35.269217','2019-01-22 08:20:38.597677',1,'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ',NULL);
INSERT INTO `todos` (id,item,created_at,updated_at,category_id,description,completed_at) VALUES (4,'Do Mission 18','2019-01-16 06:41:24.972038','2019-01-22 10:49:15.657592',4,'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ',NULL);
INSERT INTO `todos` (id,item,created_at,updated_at,category_id,description,completed_at) VALUES (5,'Do Mission 19','2019-01-22 08:21:08.374344','2019-01-22 08:21:08.374344',3,'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',NULL);
CREATE TABLE IF NOT EXISTS `categories` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `categories` (id,name,created_at,updated_at) VALUES (1,'Undefined','2019-01-09 08:22:43.331448','2019-01-18 17:16:57.860146');
INSERT INTO `categories` (id,name,created_at,updated_at) VALUES (3,'School','2019-01-15 08:47:52.734128','2019-01-15 08:47:52.734128');
INSERT INTO `categories` (id,name,created_at,updated_at) VALUES (4,'Chores','2019-01-17 11:41:25.923044','2019-01-17 11:41:25.923044');
CREATE INDEX IF NOT EXISTS `index_todos_on_category_id` ON `todos` (
	`category_id`
);
COMMIT;
