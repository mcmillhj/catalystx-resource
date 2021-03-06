package TestApp::Schema::Result::Resource::Lyric;
use strict;
use warnings;
use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/ Ordered Core /);
__PACKAGE__->table('lyric');
__PACKAGE__->add_columns(
    id => {
        data_type => 'int',
        is_numeric => 1,
        is_auto_increment => 1
    },
    album_id => {
        data_type => 'int',
        is_numeric => 1,
    },
    name => {
        data_type => 'varchar',
    },
    'position',
    {
        data_type => 'integer',
        is_numeric => 1,
        is_nullable => 0,
    },
);

__PACKAGE__->set_primary_key ('id');
__PACKAGE__->resultset_attributes({ order_by => 'position' });
__PACKAGE__->position_column('position');
__PACKAGE__->grouping_column('album_id');

__PACKAGE__->belongs_to(
    'album',
    'TestApp::Schema::Result::Resource::Album',
    'album_id'
);

1;
