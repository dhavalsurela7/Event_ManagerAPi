using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class QueryParams
    {
        public int START_INDEX { get; set; } = 0;

        private int _pageSize = 10;
        public int PAGE_SIZE
        {
            get => _pageSize;
            set => _pageSize = value > 50 ? 50 : value;
        }

        public string SORT_COLUMN_NAME { get; set; }

        public string SEARCH_TEXT { get; set; }
        public string SORT_COLUMN_DIRECTION { get; set; }
    }
}
