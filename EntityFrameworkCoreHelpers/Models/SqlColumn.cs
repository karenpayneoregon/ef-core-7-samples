namespace EntityFrameworkCoreHelpers.Models
{
    public class SqlColumn
    {
        public bool IsPrimaryKey { get; set; }
        public bool IsForeignKey { get; set; }
        public bool IsNullable { get; set; }
        /// <summary>
        /// Column/property name
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// Description/comment from table definition in database table
        /// </summary>
        public string Description { get; set; }
        public override string ToString() => Name;

    }
}